{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$EDITING_RESOURCE}</div>
        <div class="card-body">
            {if isset($ERRORS)}
            <div class="alert alert-danger">
                {foreach from=$ERRORS item=error} {$error}
                <br /> {/foreach}
            </div>
            {/if}
            <form action="" method="post">
                <div class="form-group">
                    <label for="inputTitle">{$NAME}</label>
                    <input type="text" id="inputTitle" class="form-control" name="title" placeholder="{$NAME}" value="{$RESOURCE_NAME}">
                </div>
                <div class="form-group">
                    <label for="inputShort_description">{$SHORT_DESCRIPTION}</label>
                    <input class="form-control" type="text" id="inputShort_description" name="short_description" placeholder="{$SHORT_DESCRIPTION}" value="{$RESOURCE_SHORT_DESCRIPTION}">
                </div>
                <div class="form-group">
                    <label for="editor">{$DESCRIPTION}</label>
                    <textarea name="description" id="editor" rows="15">{$RESOURCE_DESCRIPTION}</textarea>
                </div>
                <div class="form-group">
                    <label for="inputContributors">{$CONTRIBUTORS}</label>
                    <input type="text" class="form-control" name="contributors" id="inputContributors" placeholder="{$CONTRIBUTORS}" value="{$RESOURCE_CONTRIBUTORS}">
                </div>
                {if isset($PRICE)}
                <div class="form-group" id="priceFormGroup">
                    <label for="inputPrice">{$PRICE}</label>
                    <div class="input-group mb-3">
                        <input type="number" step="0.01" min="0.01" class="form-control" id="inputPrice" name="price" value="{$RESOURCE_PRICE}">
                        <div class="input-group-append">
                            <span class="input-group-text">{$CURRENCY}</span>
                        </div>
                    </div>
                </div>
                <div class="form-group" id="discountFormGroup">
                    <label for="inputDiscount">{$DISCOUNT}</label>
                    <div class="input-group mb-3">
                        <input type="number"  min="0" class="form-control" id="inputDiscount" name="discount" value="{$RESOURCE_DISCOUNT}">
                            <span class="input-group-text">%</span>
                    </div>
                </div>
                {/if}
                <input type="hidden" name="token" value="{$TOKEN}">
                <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                <a class="btn btn-secondary" href="{$CANCEL_LINK}" onclick="return confirm('{$CONFIRM_CANCEL}')">{$CANCEL}</a>
            </form>
        </div>
    </div>
</div>
{include file='footer.tpl'}