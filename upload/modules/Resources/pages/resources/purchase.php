<?php
/*
 *  Made by Samerton
 *  https://github.com/NamelessMC/Nameless/
 *  NamelessMC version 2.0.0-pr13
 *
 *  License: MIT
 *
 *  Resources - purchase
 */
// Always define page name
define('PAGE', 'resources');
define('RESOURCE_PAGE', 'purchase');

if(!$user->isLoggedIn()){
    Redirect::to(URL::build('/resources'));
}

$groups = [];
foreach ($user->getGroups() as $group) {
    $groups[] = $group->id;
}

// Get resource
$rid = explode('/', $route);
$rid = $rid[count($rid) - 1];

if (!strlen($rid)) {
    Redirect::to(URL::build('/resources'));
}

$rid = explode('-', $rid);
if(!is_numeric($rid[0])){
    Redirect::to(URL::build('/resources'));
}
$rid = $rid[0];

$resource = DB::getInstance()->get('resources', ['id', '=', $rid]);
if (!$resource->count()) {
    Redirect::to(URL::build('/resources'));
}
$resource = $resource->first();

if($user->data()->id == $resource->creator_id || $resource->type == 0){
    // Can't purchase own resource
    Redirect::to(URL::build('/resources'));
}

require(ROOT_PATH . '/modules/Resources/classes/Resources.php');
$resources = new Resources();

// Check permissions
if (!$resources->canDownloadResourceFromCategory($groups, $resource->category_id)) {
    // Can't view
    Redirect::to(URL::build('/resources'));
}

// Already purchased?
$already_purchased = DB::getInstance()->query('SELECT id, status FROM nl2_resources_payments WHERE resource_id = ? AND user_id = ?', [$resource->id, $user->data()->id])->results();
if(count($already_purchased)){
    $already_purchased_id = $already_purchased[0]->id;
    $already_purchased = $already_purchased[0]->status;

    if($already_purchased == 0 || $already_purchased == 1){
        // Already purchased
        Redirect::to(URL::build('/resources/resource/' . Output::getClean($resource->id . '-' . URL::urlSafe($resource->name))));
    }
}

if(isset($_GET['do'])){
    require_once(ROOT_PATH . '/modules/Resources/paypal.php');

    if($_GET['do'] == 'complete'){
        // Insert into database
        if(!isset($_SESSION['resource_purchasing'])){
            // Error, resource ID has been lost
            Session::flash('purchase_resource_error', $resource_language->get('resources', 'sorry_please_try_again'));
            Redirect::to(URL::build('/resources/purchase/' . Output::getClean($resource->id . '-' . URL::urlSafe($resource->name))));

        } else {
            $paymentId = $_GET['paymentId'];
            $payment = \PayPal\Api\Payment::get($paymentId, $apiContext);

            $execution = new \PayPal\Api\PaymentExecution();
            $execution->setPayerId($_GET['PayerID']);

            try {
                $result = $payment->execute($execution, $apiContext);

                $payment = \PayPal\Api\Payment::get($paymentId, $apiContext);

            } catch(Exception $e){
                Session::flash('purchase_resource_error', $resource_language->get('resources', 'error_while_purchasing'));
                ErrorHandler::logCustomError($e->getMessage());
                Redirect::to(URL::build('/resources/purchase/' . Output::getClean($resource->id . '-' . URL::urlSafe($resource->name))));
            }

            if(isset($already_purchased_id) && $already_purchased == 2){
                // Update a cancelled purchase
                DB::getInstance()->update('resources_payments', $already_purchased_id, [
                    'status' => 0,
                    'created' => date('U'),
                    'transaction_id' => $payment->getId()
                ]);

            } else {
                // Create a new purchase
                DB::getInstance()->insert('resources_payments', [
                    'status' => 0,
                    'created' => date('U'),
                    'user_id' => $user->data()->id,
                    'resource_id' => $resource->id,
                    'transaction_id' => $payment->getId()
                ]);
            }

            // TODO: alerts
            //Alert::create('');
        }

    }

} else {
    if(Input::exists()){
        if(Token::check(Input::get('token'))){
            if($_POST['action'] == 'agree'){
                // Create PayPal request
                if(!file_exists(ROOT_PATH . '/modules/Resources/paypal.php')){
                    $error = $resource_language->get('resources', 'paypal_not_configured');
                } else {
                    $_SESSION['resource_purchasing'] = $resource->id;

                    $currency = DB::getInstance()->get('settings', ['name', '=', 'resources_currency']);
                    if (!$currency->count()) {
                        DB::getInstance()->insert('settings', [
                            'name' => 'resources_currency',
                            'value' => 'GBP'
                        ]);
                        $currency = 'GBP';

                    } else {
                        $currency = Output::getClean($currency->first()->value);
                    }

                    // Get author's PayPal
                    $author_paypal = DB::getInstance()->get('resources_users_premium_details', ['user_id', '=', $resource->creator_id]);
                    if (!$author_paypal->count() || !strlen($author_paypal->first()->paypal_email)){
                        $error = $resource_language->get('resources', 'author_doesnt_have_paypal');

                    } else {
                        $author_paypal = Output::getClean($author_paypal->first()->paypal_email);

                        require_once(ROOT_PATH . '/modules/Resources/paypal.php');

                        $payer = new \PayPal\Api\Payer();
                        $payer->setPaymentMethod('paypal');

                        $payee = new \PayPal\Api\Payee();
                        $payee->setEmail($author_paypal);

                        $amount = new \PayPal\Api\Amount();
                        $newPrice = $resource->price - ($resource->price * ($resource->discount / 100));
                        $amount->setTotal($newPrice);
                        $amount->setCurrency($currency);

                        $exp_id = json_decode(getExpProfileId($apiContext), true);

                        $transaction = new \PayPal\Api\Transaction();
                        $transaction->setAmount($amount);
                        $transaction->setPayee($payee);
                        $transaction->setDescription(Output::getClean($resource->name));

                        $redirectUrls = new \PayPal\Api\RedirectUrls();
                        $redirectUrls->setReturnUrl(rtrim(URL::getSelfURL(), '/') . URL::build('/resources/purchase/' . Output::getClean($resource->id . '-' . URL::urlSafe($resource->name)) . '/', 'do=complete'))
                            ->setCancelUrl(rtrim(URL::getSelfURL(), '/') . URL::build('/resources/purchase/' . Output::getClean($resource->id . '-' . URL::urlSafe($resource->name)) . '/', 'do=cancel'));

                        $payment = new \PayPal\Api\Payment();
                        $payment->setIntent('sale')
                            ->setPayer($payer)
                            ->setExperienceProfileId($exp_id['id'])
                            ->setTransactions([$transaction])
                            ->setRedirectUrls($redirectUrls);

                        try {
                            $payment->create($apiContext);

                            Redirect::to($payment->getApprovalLink());

                        } catch (\PayPal\Exception\PayPalConnectionException $ex) {
                            $ex_data = $ex->getData();
                            ErrorHandler::logCustomError($ex_data);
                            $ex_msg = json_decode($ex_data, true)['message'];
                            $error = $resource_language->get('resources', 'error_while_purchasing') . " (" . $ex_msg . ")";

                        }
                    }
                }
            }

        } else
            $error = $language->get('general', 'invalid_token');
    }
}

$page_title = $resource_language->get('resources', 'purchasing_resource_x', ['resource' => Output::getClean($resource->name)]);
require_once(ROOT_PATH . '/core/templates/frontend_init.php');

if(isset($_GET['do'])){
    if($_GET['do'] == 'complete'){
        $smarty->assign([
            'PURCHASING_RESOURCE' => $resource_language->get('resources', 'purchasing_resource_x', ['resource' => Output::getClean($resource->name)]),
            'PURCHASE_COMPLETE' => $resource_language->get('resources', 'purchase_complete'),
            'BACK_LINK' => URL::build('/resources/resource/' . Output::getClean($resource->id . '-' . URL::urlSafe($resource->name))),
            'BACK' => $language->get('general', 'back')
        ]);

        $template_file = 'resources/purchase_pending.tpl';
    } else {
        $smarty->assign([
            'PURCHASING_RESOURCE' => $resource_language->get('resources', 'purchasing_resource_x', ['resource' => Output::getClean($resource->name)]),
            'PURCHASE_CANCELLED' => $resource_language->get('resources', 'purchase_cancelled'),
            'BACK_LINK' => URL::build('/resources/resource/' . Output::getClean($resource->id . '-' . URL::urlSafe($resource->name))),
            'BACK' => $language->get('general', 'back')
        ]);

        $template_file = 'resources/purchase_cancelled.tpl';
    }

} else {
    $pre_purchase_info = DB::getInstance()->get('privacy_terms', ['name', '=', 'resource']);
    if (!$pre_purchase_info->count()) {
        $pre_purchase_info = '<p>You will be redirected to PayPal to complete your purchase.</p><p>Access to the download will only be granted once the payment has been completed, this may take a while.</p><p>Please note, ' . SITE_NAME . ' can\'t take any responsibility for purchases that occur through our resources section. If you experience any issues with the resource, please contact the resource author directly.</p><p>If your access to ' . SITE_NAME . ' is revoked (for example, your account is banned), you will lose access to any purchased resources.</p>';

        DB::getInstance()->insert('privacy_terms', [
            'name' => 'resource',
            'value' => $pre_purchase_info
        ]);
    } else
        $pre_purchase_info = Output::getPurified($pre_purchase_info->first()->value);

    // Assign Smarty variables
    $smarty->assign([
        'PURCHASING_RESOURCE' => $resource_language->get('resources', 'purchasing_resource_x', ['resource' => Output::getClean($resource->name)]),
        'CANCEL' => $language->get('general', 'cancel'),
        'CONFIRM_CANCEL' => $language->get('general', 'confirm_cancel'),
        'CANCEL_LINK' => URL::build('/resources/resource/' . Output::getClean($resource->id . '-' . URL::urlSafe($resource->name))),
        'PRE_PURCHASE_INFO' => $pre_purchase_info,
        'PURCHASE' => $resource_language->get('resources', 'purchase'),
        'TOKEN' => Token::get()
    ]);

    $template_file = 'resources/purchase.tpl';
}

if(Session::exists('purchase_resource_error'))
    $error = Session::flash('purchase_resource_error');

if(isset($error))
    $smarty->assign('ERROR', $error);

// Load modules + template
Module::loadPage($user, $pages, $cache, $smarty, [$navigation, $cc_nav, $staffcp_nav], $widgets, $template);

$template->onPageLoad();

require(ROOT_PATH . '/core/templates/navbar.php');
require(ROOT_PATH . '/core/templates/footer.php');

$template->displayTemplate($template_file, $smarty);

function getExpProfileId($webContext) {

    $flowConfig = new \PayPal\Api\FlowConfig();
    // Type of PayPal page to be displayed when a user lands on the PayPal site for checkout. Allowed values: Billing or Login. When set to Billing, the Non-PayPal account landing page is used. When set to Login, the PayPal account login landing page is used.
    $flowConfig->setLandingPageType("Billing");
    // The URL on the merchant site for transferring to after a bank transfer payment.
    $flowConfig->setBankTxnPendingUrl(rtrim(URL::getSelfURL(), '/'));
    // When set to "commit", the buyer is shown an amount, and the button text will read "Pay Now" on the checkout page.
    $flowConfig->setUserAction("commit");
    // Defines the HTTP method to use to redirect the user to a return URL. A valid value is `GET` or `POST`.
    $flowConfig->setReturnUriHttpMethod("GET");

    // Parameters for style and presentation.
    //$presentation = new \PayPal\Api\Presentation();

    // A URL to logo image. Allowed values: .gif, .jpg, or .png.
    //$presentation->setLogoImage("https://www.browsit.org/favicon.ico")
        //	A label that overrides the business name in the PayPal account on the PayPal pages.
        //->setBrandName("SiteName")
        //  Locale of pages displayed by PayPal payment experience.
        //->setLocaleCode("US")
        // A label to use as hypertext for the return to merchant link.
        //->setReturnUrlLabel("Return")
        // A label to use as the title for the note to seller field. Used only when `allow_note` is `1`.
        //->setNoteToSellerLabel("Thanks!");

    // Parameters for input fields customization.
    $inputFields = new \PayPal\Api\InputFields();
    // Enables the buyer to enter a note to the merchant on the PayPal page during checkout.
    $inputFields->setAllowNote(false)
        // Determines whether or not PayPal displays shipping address fields on the experience pages. Allowed values: 0, 1, or 2. When set to 0, PayPal displays the shipping address on the PayPal pages. When set to 1, PayPal does not display shipping address fields whatsoever. When set to 2, if you do not pass the shipping address, PayPal obtains it from the buyer’s account profile. For digital goods, this field is required, and you must set it to 1.
        ->setNoShipping(1)
        // Determines whether or not the PayPal pages should display the shipping address and not the shipping address on file with PayPal for this buyer. Displaying the PayPal street address on file does not allow the buyer to edit that address. Allowed values: 0 or 1. When set to 0, the PayPal pages should not display the shipping address. When set to 1, the PayPal pages should display the shipping address.
        ->setAddressOverride(0);

    // #### Payment Web experience profile resource
    $webProfile = new \PayPal\Api\WebProfile();

    // Name of the web experience profile. Required. Must be unique
    $webProfile->setName("NamelessMC" . uniqid())
        // Parameters for flow configuration.
        ->setFlowConfig($flowConfig)
        // Parameters for style and presentation.
        //->setPresentation($presentation)
        // Parameters for input field customization.
        ->setInputFields($inputFields)
        // Indicates whether the profile persists for three hours or permanently. Set to `false` to persist the profile permanently. Set to `true` to persist the profile for three hours.
        ->setTemporary(true);

    try {
        $createProfileResponse = $webProfile->create($webContext);
    } catch (\PayPal\Exception\PayPalConnectionException $ex) {
        ErrorHandler::logCustomError($ex->getData());
        exit(1);
    }

    return $createProfileResponse;
}