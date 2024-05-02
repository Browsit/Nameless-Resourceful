{extends file="layout.tpl"}

{block name=heading}

	<h2>{$VIEWING_RESOURCES_BY}</h2>

{/block}

{block name=content}

	{if !empty($LATEST_RESOURCES)}
		<div class="action-bar">
			<div class="action-bar-pagination">
				{$PAGINATION}
			</div>
		</div>
	{/if}

	{if !empty($LATEST_RESOURCES)}
		<div class="card">
			<div class="card-body">
				<div class="list list-relaxed list-divided">
					{foreach from=$LATEST_RESOURCES item=resource}
						<div class="list-item">
							<div class="list-icon">
								<a href="{$resource.link}">
									<img src="{$resource.icon}" alt="{$resource.name}">
								</a>
							</div>
							<div class="list-content">
								{if isset($resource.price)}
									<span class="badge bg-danger float-end me-md-4">{$resource.price} {$CURRENCY}</span>
                                    {if isset($resource.discount)}
                                        <span class="badge bg-success float-end" style="margin-left:5px;">{$resource.discount}% off</span>
                                    {/if}
								{/if}
								<strong>
									<a href="{$resource.link}">{$resource.name}</a>
								</strong>
								<small>[{$resource.version}]</small>
								<div class="list-meta">
									<div>
										{if ($resource.short_description)}
											{$resource.short_description}
										{else}
											{$resource.description}
										{/if}
									</div>
									<div>
										<a href="{$resource.author_profile}" style="{$resource.author_style}">{$resource.author}</a>
										&bull;
										{$resource.category}
										&bull;
										<span title="{$resource.updated_full}">{$resource.updated}</span>
									</div>
									<div class="d-sm-none">
										<div class="d-inline star-rating view">
											<span class="far fa-star" data-rating="1"></span>
											<span class="far fa-star" data-rating="2"></span>
											<span class="far fa-star" data-rating="3"></span>
											<span class="far fa-star" data-rating="4"></span>
											<span class="far fa-star" data-rating="5"></span>
											<input type="hidden" class="rating-value" name="rating" value="{$resource.rating}">
										</div>
										&bull;
										{$resource.views}
										&bull;
										{$resource.downloads}
									</div>
								</div>
							</div>
							<div class="list-extra d-none d-sm-block text-end">
								<div class="star-rating view">
									<span class="far fa-star" data-rating="1"></span>
									<span class="far fa-star" data-rating="2"></span>
									<span class="far fa-star" data-rating="3"></span>
									<span class="far fa-star" data-rating="4"></span>
									<span class="far fa-star" data-rating="5"></span>
									<input type="hidden" class="rating-value" name="rating" value="{$resource.rating}">
								</div>
								<div class="meta">
									{$resource.views}
									<br />
									{$resource.downloads}
								</div>
							</div>
						</div>
					{/foreach}
				</div>
			</div>
		</div>
	{else}
		<div class="card">
			<div class="card-body">
				{$NO_RESOURCES}
			</div>
		</div>
	{/if}

	{if !empty($LATEST_RESOURCES)}
		<div class="action-bar">
			<div class="action-bar-pagination">
				{$PAGINATION}
			</div>
		</div>
	{/if}

{/block}