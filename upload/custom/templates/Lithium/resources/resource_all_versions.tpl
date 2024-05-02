{extends file="layout.tpl"}

{block name=heading}

	<div class="d-flex align-items-center flex-wrap mb-4">
		<div class="d-flex align-items-center">
			<div class="me-3">
				<img src="{$RESOURCE_ICON}" alt="{$RESOURCE_NAME}" style="width: 64px; height: 64px; border-radius: var(--avatars-border-radius);">
			</div>
			<div>
				<h2>{$VIEWING_ALL_VERSIONS}</h2>
				<div class="meta">
					{$RESOURCE_SHORT_DESCRIPTION}
				</div>
			</div>
		</div>
	</div>

{/block}

{block name=content}

	<div class="action-bar">
		<div class="action-bar-pagination">
			{$PAGINATION}
		</div>
		<div class="action-bar-buttons">
			<a href="{$BACK_LINK}" class="btn btn-secondary btn-sm">{$BACK}</a>
			{if isset($LOG_IN_TO_DOWNLOAD) && !isset($LOGGED_IN_USER)}
				<a href="{$CONFIG_PATH}login" class="btn btn-primary btn-sm">{$LOG_IN_TO_DOWNLOAD}</a>
			{else if isset($DOWNLOAD_URL)}
				<a href="{$DOWNLOAD_URL}" class="btn btn-primary btn-sm">{$DOWNLOAD}</a>
			{else if isset($PURCHASE_FOR_PRICE)}
				<a href="{if isset($PURCHASE_LINK)}{$PURCHASE_LINK}{else}#{/if}" class="btn btn-primary btn-sm{if !isset($PURCHASE_LINK)} disabled{/if}">{$PURCHASE_FOR_PRICE}</a>
			{else if isset($PAYMENT_PENDING)}
				<a class="btn btn-primary disabled">{$PAYMENT_PENDING}</a>
			{/if}
		</div>
	</div>

	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a href="{$OVERVIEW_LINK}" class="nav-link">{$OVERVIEW_TITLE}</a>
		</li>
		<li class="nav-item">
			<a href="{$OTHER_RELEASES_LINK}" class="nav-link">{$RELEASES_TITLE}</a>
		</li>
		<li class="nav-item">
			<a href="{$VERSIONS_LINK}" class="nav-link active">{$VERSIONS_TITLE}</a>
		</li>
		<li class="nav-item">
			<a href="{$REVIEWS_LINK}" class="nav-link">{$REVIEWS_TITLE}</a>
		</li>
	</ul>

	<div class="card">
		<div class="card-body">
			<div class="list list-relaxed list-divided">
				{foreach from=$RELEASES item=release}
					<div class="list-item align-items-center">
						<div class="list-content">
							{$release.tag}
							<small>
								<div class="star-rating view d-inline-block ms-2">
									<span class="far fa-star" data-rating="1"></span>
									<span class="far fa-star" data-rating="2"></span>
									<span class="far fa-star" data-rating="3"></span>
									<span class="far fa-star" data-rating="4"></span>
									<span class="far fa-star" data-rating="5"></span>
									<input type="hidden" name="rating" class="rating-value" value="{$release.rating}">
								</div>
							</small>
							<div class="list-meta">
								{$release.downloads}
								&bull;
								Released <span data-bs-toggle="tooltip" title="{$release.date_full}">{$release.date}</span>
							</div>
						</div>
						<div class="list-extra">
							{if isset($LOG_IN_TO_DOWNLOAD)}
                                <a disabled target="_blank" class="btn btn-secondary btn-sm">{$LOG_IN_TO_DOWNLOAD}</a>
                            {else}
                                <a href="{$release.download_url}" target="_blank" class="btn btn-secondary btn-sm">{$DOWNLOAD}</a>
                            {/if}
						</div>
					</div>
				{/foreach}
			</div>
		</div>
	</div>

	<div class="action-bar">
		<div class="action-bar-pagination">
			{$PAGINATION}
		</div>
		<div class="action-bar-buttons">
			<a href="{$BACK_LINK}" class="btn btn-secondary btn-sm">{$BACK}</a>
			{if isset($LOG_IN_TO_DOWNLOAD) && !isset($LOGGED_IN_USER)}
				<a href="{$CONFIG_PATH}login" class="btn btn-primary btn-sm">{$LOG_IN_TO_DOWNLOAD}</a>
			{else if isset($DOWNLOAD_URL)}
				<a href="{$DOWNLOAD_URL}" class="btn btn-primary btn-sm">{$DOWNLOAD}</a>
			{else if isset($PURCHASE_FOR_PRICE)}
				<a href="{if isset($PURCHASE_LINK)}{$PURCHASE_LINK}{else}#{/if}" class="btn btn-primary btn-sm{if !isset($PURCHASE_LINK)} disabled{/if}">{$PURCHASE_FOR_PRICE}</a>
			{else if isset($PAYMENT_PENDING)}
				<a class="btn btn-primary disabled">{$PAYMENT_PENDING}</a>
			{/if}
		</div>
	</div>

{/block}