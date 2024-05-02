{extends file="layout.tpl"}

{block name=heading}

	<h2>{$EDITING_RESOURCE}</h2>

{/block}

{block name=content}

	{if !empty($ERRORS)}
		<div class="container alert alert-danger">
			{foreach from=$ERRORS item=error}
				<li>{$error}</li>
			{/foreach}
		</div>
	{/if}

	<div class="card">
		<div class="card-body">
			<form action="" method="post">
				<div class="form-group">
					<label class="form-label" for="input-title">{$NAME}</label>
					<input type="text" name="title" class="form-control" id="input-title" placeholder="{$NAME}" value="{$RESOURCE_NAME}">
				</div>
				<div class="form-group">
					<label class="form-label" for="input-shortDescription">{$SHORT_DESCRIPTION}</label>
					<input type="text" name="short_description" class="form-control" id="input-shortDescription" value="{$RESOURCE_SHORT_DESCRIPTION}">
				</div>
				{if !isset($MARKDOWN)}
					<div class="form-group">
						<label class="form-label" for="editor">{$DESCRIPTION}</label>
						<textarea class="form-control" id="editor" name="description">{$RESOURCE_DESCRIPTION}</textarea>
					</div>
				{else}
					<div class="form-group">
						<label class="form-label" for="markdown">{$DESCRIPTION}</label>
						<textarea class="form-control" id="markdown" name="description">{$RESOURCE_DESCRIPTION}</textarea>
						<div class="form-meta">
							{$MARKDOWN_HELP}
						</div>
					</div>
				{/if}
				<div class="form-group">
					<label class="form-label" for="input-contributors">{$CONTRIBUTORS}</label>
					<input type="text" class="form-control" id="input-contributors" name="contributors" placeholder="{$CONTRIBUTORS}" value="{$RESOURCE_CONTRIBUTORS}">
				</div>
				{if isset($PRICE)}
					<div class="form-group" id="priceFormGroup">
						<label class="form-label" for="input-price">{$PRICE}</label>
						<div class="input-group">
							<input type="number" class="form-control" id="input-price" name="price" step="0.1" min="0.1" placeholder="{$RESOURCE_PRICE}">
							<span class="input-group-text">{$CURRENCY}</span>
						</div>
					</div>
					<div class="form-group" id="discountFormGroup">
                        <label class="form-label" for="input-discount">{$DISCOUNT}</label>
                        <div class="input-group">
                            <input type="number" class="form-control" id="input-discount" name="discount" min="0" value="{$RESOURCE_DISCOUNT}">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
				{/if}
				<div class="form-actions">
					<a href="{$CANCEL_LINK}" class="btn btn-secondary" onclick="return confirm('{$CONFIRM_CANCEL}')">{$CANCEL}</a>
					<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
				</div>
				<input type="hidden" name="token" value="{$TOKEN}">
			</form>
		</div>
	</div>

{/block}