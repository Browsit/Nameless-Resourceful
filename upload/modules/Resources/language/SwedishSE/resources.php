<?php 
/*
 *	Made by Samerton
 *  https://github.com/NamelessMC/Nameless/
 *  NamelessMC version 2.0.0-pr9
 *
 *  License: MIT
 *
 *  SwedishSE Language for Resources module
 */

$language = array(
	/*
	 *  Resources
	 */ 
	'resources' => 'Resurser',
	'categories' => 'Kategories',
	'no_resources' => 'Inga resurser har blivit skapade än.',
	'new_resource' => 'Ny resurs',
	'select_category' => 'Välj kategori',
	'github_username' => 'GitHub användarnamn',
	'github_repo_name' => 'GitHub förvars namn',
	'link_to_github_repo' => 'Länk till GitHub förvaring',
	'required' => 'Obligatorisk',
	'resource_name' => 'Namn',
	'resource_icon' => 'Resource Icon',
	'resource_upload_icon' => 'Upload Icon',
	'resource_change_icon' => 'Change Icon',
	'resource_short_description' => 'Short description',
	'resource_description' => 'Beskrivning',
	'version_tag' => 'Versions Tagg',
	'version_tag_help' => 'Detta måste matcha din GitHub Utgåva',
	'contributors' => 'Medvärkande',
	'name_required' => 'Vänligen mata in ett resurs namn',
	'short_description_required' => 'Please enter a short description',
	'content_required' => 'Vänligen mata in en resurs beskrivning',
	'github_username_required' => 'Vänligen mata in ditt GitHub användarnamn',
	'github_repo_required' => 'Vänligen mata in ditt GitHub förvars namn',
	'version_tag_required' => 'Vänligen mata in en versions tagg för din resurs',
	'category_required' => 'Vänligen välj en kategori för din resurs',
	'name_min_2' => 'Resursens namn måste vara minst 2 bokstäver',
	'short_description_min_2' => 'The short description must be a minimum of 2 characters',
	'content_min_2' => 'Resursens beskrivning måste vara minst 2 bokstäver',
	'github_username_min_2' => 'Ditt GitHub användarnamn måste vara minst 2 bokstäver',
	'github_repo_min_2' => 'Ditt GitHub förvars namn måste vara minst 2 bokstäver',
	'name_max_64' => 'Resursens namn får max vara 64 bokstäver',
	'short_description_max_64' => 'The short description must be a maximum of 64 characters',
	'content_max_20000' => 'Resursens beskrivning får max vara 20000 bokstäver',
	'github_username_max_32' => 'Ditt GitHub användarnamn får vara max 32 bokstäver',
	'github_repo_max_64' => 'Ditt GitHub förvars namn får max vara 64 bokstäver',
	'version_max_16' => 'Versions taggen får max vara 16 bokstäver',
	'contributors_max_255' => 'Medvärkande listan får max vara 255 bokstäver.',
	'unable_to_get_repo' => 'Kunde inte få tag i senaste utgåvans information från {x}. Har du skapat en ny utgåva på GitHub?',
	'update_already_exists' => 'En uppdatering med den taggen finns redan!',
	'select_release' => 'Välj en utgåva:',
	'resource' => 'Resurs',
	'stats' => 'Statistik',
	'author' => 'Utvecklare',
	'x_views' => '{x} visningar', // Don't replace {x}
	'x_downloads' => '{x} nedladdningar', // Don't replace {x}
	'in_category_x' => 'i kategori {x}', // Don't replace {x}
	'viewing_resource_x' => 'Visar resurs {x}', // Don't replace {x}
	'resource_index' => 'Resurs Index',
	'reviews' => 'Recensioner',
	'view_other_resources' => 'Se {x}\'s andra resurser', // Don't replace {x}
	'download' => 'Ladda ner',
	'other_releases' => 'Andra utgåvor',
	'no_reviews' => 'Inga recensioner',
	'new_review' => 'Ny recension',
	'update' => 'Uppdatera resurs',
	'updated_x' => 'uppdaterad {x}', // Don't replace {x}
	'viewing_all_releases' => 'Visar alla utgåvor för resurs {x}', // Don't replace {x}
	'viewing_release' => 'Visar utgåva {x} för resurs {y}', // Don't replace {x} or {y}
	'viewing_all_versions' => 'Viewing all versions for resource {x}', // Don't replace {x}
	'viewing_all_reviews' => 'Viewing all reviews for resource {x}', // Don't replace {x}
    'editing_resource' => 'Redigerar Resurs',
    'contributors_x' => 'Medverkande: {x}', // Don't replace {x}
    'move_resource' => 'Flytta resurs',
    'delete_resource' => 'Radera resurs',
    'confirm_delete_resource' => 'Är du säker på att du vill radera resursen {x}?', // Don't replace {x}
    'invalid_category' => 'Du har valt en felaktig kategori',
    'move_to' => 'Flytta resurs till:',
    'no_categories_available' => 'Det finns inga kategorier tillgängliga att flytta denna resurs till!',
    'delete_review' => 'Radera Recension',
    'confirm_delete_review' => 'Är du säker på att du vill radera recensionen?',
    'viewing_resources_by_x' => 'Visar resurser av {x}', // Don't replace {x}
	'release_type' => 'Typ av utgåva',
    'zip_file' => 'Zip Fil',
    'github_release' => 'GitHub utgåva',
    'type' => 'Typ',
    'free_resource' => 'Gratis Resurs',
    'premium_resource' => 'Premium Resurs',
    'price' => 'Pris',
    'invalid_price' => 'Felaktigt pris.',
    'paypal_email_address' => 'PayPal Email Address',
    'paypal_email_address_info' => 'Detta är PayPal email addressen pengar kommer bli skickade till när någon köper din resurs.',
    'invalid_email_address' => 'Vänligen mata in en giltig PayPal email address, mellan 4 och 64 bokstäver.',
    'no_payment_email' => 'Det finns ingen PayPal email address länkad med ditt konto. Du kan lägga till en senare i UserCP.',
    'my_resources' => 'Mina Resurser',
    'purchased_resources' => 'Köpta Resurser',
    'no_purchased_resources' => 'Du har inte köpt några resurser än.',
    'choose_file' => 'Välj fil',
    'zip_only' => 'Endast .zip filer',
    'file_not_zip' => 'Detta är inte en .zip fil',
    'filesize_max_x' => 'Filen måste vara minst {x}kb stor', // Don't replace {x}, unit kilobytes
	'file_upload_failed' => 'Fil uppladdning misslyckades med kod {x}', // Don't replace {x}
	'purchase_for_x' => 'Köp för {x}', // Don't replace {x}
	'purchase' => 'Köp',
    'purchasing_resource_x' => 'Köper {x}', // Don't replace {x}
	'payment_pending' => 'Betalning Behandlas',
    'update_title' => 'Uppdatera Titel',
    'update_information' => 'Uppdatera information',
	'paypal_not_configured' => 'PayPal integrationen har inte konfigurerats än! Vänligen kontakta en administratör.',
	'error_while_purchasing' => 'Ett fel uppstod under köp av denna resurs. Vänligen kontakta en administratör.',
	'author_doesnt_have_paypal' => 'Resurs utvecklaren har inte länkat sitt PayPal konto än.',
	'sorry_please_try_again' => 'Ett fel uppstod, försök igen.',
    'purchase_cancelled' => 'Köpet har avbrytits.',
    'purchase_complete' => 'Köpet är klart. Resursen kommar endast bli tillgänglig för nerladdning när betalningen är helt klar.',
    'log_in_to_download' => 'Logga in för att ladda ner',
	'external_download' => 'Extern nerladdning',
    'external_link' => 'Extern Länk',
    'external_link_error' => 'Vänligen mata in en giltig extern länk, mellan x och y bokstäver lång.',
    'select_release_type_error' => 'Vänligen välj en releasetyp.',
    'sort_by' => 'Sortera Efter',
    'last_updated' => 'Senast Uppdaterad',
    'newest' => 'Nyast',
    'overview' => 'Overview',
    'releases_x' => 'Releases ({x})', // Don't replace {x}
    'versions_x' => 'Versions ({x})', // Don't replace {x}
    'reviews_x' => 'Reviews ({x})', // Don't replace {x}

    //widgets
    'latest_resources' => 'Latest Resources',
    'top_resources' => 'Top Resources',
    'no_latest_resources' => 'No resources',
    'no_top_resources' => 'No resources',

    'manage_licenses' => 'Hantera Licenser',
    'managing_licenses_for' => 'Hanterar licenser för {x}',
    'no_licenses' => 'Det finns inga licenser för denna resurs.',
    'select_resource' => 'Välj en resurs-',
    '1_license' => '1 license',
    'x_licenses' => '{x} licenser',
    'no_premium_resources' => 'Du har inte skapat några premium resurser än.',
    'add_license' => 'Lägg till licens.',
    'revoke' => 'Upphäv',
    'reinstate' => 'Återställ',
    'unable_to_update_license' => 'Kunde inte uppdatera licens.',
    'unable_to_add_license_for_yourself' => 'Du kan inte lägga till en licens för dig själv!',
    'user_already_has_license' => 'Denna användare har redan en licens.',
    'license_added_successfully' => 'Licens tillagd.',
    'find_user' => 'Hitta Användare...',
    'user' => 'Användare',
    'purchased' => 'Köpt',
    'status' => 'Status',
    'actions' => 'Insatser',

    // Payment statuses
    'status_pending' => 'Behandlas',
    'status_complete' => 'Färdig',
    'status_refund' => 'Återbetalad',
    'status_cancelled' => 'Avbruten',
    'status_unknown' => 'Okänd',

    'total_downloads' => 'Totala Nedladdningar',
    'first_release' => 'Första Release',
    'last_release' => 'Sista Release',
    'views' => 'Vyer',
    'category' => 'Kategori',
    'rating' => 'Betyg',
    'version_x' => 'Version {x}', // Don't replace {x}
    'release' => 'Release', // Don't replace {x}

    // Admin
    'permissions' => 'Behörigheter',
    'new_category' => '<i class="fa fa-plus-circle"></i> Ny Kategori',
    'creating_category' => 'Skapar Kategori',
    'category_name' => 'Kategori Namn',
    'category_description' => 'Kategori Beskrivning',
    'input_category_title' => 'Vänligen mata in en kategori titel.',
    'category_name_minimum' => 'Kategorins namn måste vara minst 2 bokstäver.',
    'category_name_maxmimum' => 'Kategorins namn kan max vara 150 bokstäver.',
    'category_description_maximum' => 'Kategorins beskrivning kan max vara 250 bokstäver.',
    'category_created_successfully' => 'Kategori skapad.',
    'category_updated_successfully' => 'Kategori uppdaterad.',
    'category_deleted_successfully' => 'Kategori raderad.',
    'category_permissions' => 'Kategori Behörigheter',
    'group' => 'Grupp',
    'can_view_category' => 'Kan visa kategori?',
    'can_post_resource' => 'Kan skapa resurser?',
    'moderation' => 'Moderation',
    'can_move_resources' => 'Kan flytta resurser?',
    'can_edit_resources' => 'Kan redigera resurser?',
    'can_delete_resources' => 'Kan radera resurser?',
    'can_edit_reviews' => 'Kan redigera recensioner?',
    'can_delete_reviews' => 'Kan radera recensioner?',
    'can_download_resources' => 'Kan ladda ner resurser?',
    'can_post_premium_resource' => 'Kan skapa premium resurser?',
    'delete_category' => 'Radera kategori',
    'move_resources_to' => 'Flytta resurser till',
    'delete_resources' => 'Radera resurser',
    'downloads' => 'Nedladdningar',
    'no_categories' => 'Inga kategorier har skapats än.',
    'editing_category' => 'Redigerar kategori',
    'settings' => 'Inställningar',
    'settings_updated_successfully' => 'Inställningar uppdaterade.',
    'currency' => 'ISO-4217 Valuta',
    'invalid_currency' => 'Felaktig ISO-4217 valuta! En lista av giltiga koder kan hittas <a href="https://en.wikipedia.org/wiki/ISO_4217#Active_codes" target="_blank" rel="noopener nofollow">här</a>',
    'upload_directory_not_writable' => 'Det går inte att skriva till uppladdning/nedladdnings mappen!',
    'maximum_filesize' => 'Max filstorlek (kilobytes)',
    'invalid_filesize' => 'Felaktig filstorlek!',
    'pre_purchase_information' => 'Förköpsinformation',
    'invalid_pre_purchase_info' => 'Felaktig förköpsinformation! Se till att den är under 100,000 bokstäver.',
    'paypal_api_details' => 'PayPal API Detaljer',
    'paypal_api_details_info' => 'Värdet av dessa fält är gömda av säkerhets orsaker.<br />Om du uppdaterar dessa inställningar, vänligen ange både client ID och client secret tillsammans.',
    'paypal_client_id' => 'PayPal Client ID',
    'paypal_client_secret' => 'PayPal Client Secret',
    'paypal_config_not_writable' => 'modules/Resources/paypal.php går inte att skriva till för att spara PayPal inställningar',

    // Hook
    'new_resource_text' => 'Ny resurs skapad i {x} av {y}',
    'updated_resource_text' => 'Resurs uppdaterad i {x} av {y}',

    // Alerts
    'resource_purchased' => 'Resurs Köpt',
    'resource_purchased_full' => 'Du har köpt {x}',
    'resource_purchase' => 'Resurs Köp',
    'resource_purchase_full' => 'Användaren {x} har köpt din resurs {y}',
    'resource_license_revoked' => 'Resurs licens upphävd',
    'resource_license_revoked_full' => 'En licens av resursen {x} för användaren {y} har upphävts pågrund av en nekad, återbetalad eller ångrad betalning',
    'resource_license_cancelled' => 'Resurs licens avbruten',
    'resource_license_cancelled_full' => 'Upphovsmannen till resursen {x} har avbrutit din licens.'
);
