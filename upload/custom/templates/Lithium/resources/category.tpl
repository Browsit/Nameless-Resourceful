{extends file="layout.tpl"}

{block name=heading}

	<h2>{$CATEGORY_NAME}</h2>

{/block}

{block name=content}

	<div class="row">
		<div class="col-xl-3 col-lg-4">
			{include file='resources/categories.tpl'}
		</div>
		<div class="col-xl-9 col-lg-8">
			{if !empty($LATEST_RESOURCES)}
				<div class="action-bar">
					<div class="action-bar-pagination">
						{$PAGINATION}
					</div>
					<div class="action-bar-buttons">
						<a href="{$BACK_LINK}" class="btn btn-secondary btn-sm">{$BACK}</a>
						<div class="dropdown">
							<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">{$SORT_BY} {$SORT_BY_VALUE}</a>
							<ul class="dropdown-menu dropdown-menu-end">
								<li>
									<a class="dropdown-header">{$SORT_BY}</a>
								</li>
								{foreach from=$SORT_TYPES item=item}
									<li>
										<a href="{$item.link}" class="dropdown-item">{$item.sort}</a>
									</li>
								{/foreach}
							</ul>
						</div>
						{if isset($NEW_RESOURCE)}
							<a href="{$NEW_RESOURCE_LINK}" class="btn btn-primary btn-sm">{$NEW_RESOURCE}</a>
						{/if}
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
					<div class="card-footer">
						<a href="{$BACK_LINK}" class="btn btn-secondary">{$BACK}</a>
						<a href="{$NEW_RESOURCE_LINK}" class="btn btn-primary ms-2">{$NEW_RESOURCE}</a>
					</div>
				</div>
			{/if}
			{if !empty($LATEST_RESOURCES)}
				<div class="action-bar">
					<div class="action-bar-pagination">
						{$PAGINATION}
					</div>
					<div class="action-bar-buttons">
						<a href="{$BACK_LINK}" class="btn btn-secondary btn-sm">{$BACK}</a>
						<div class="dropdown">
							<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">{$SORT_BY} {$SORT_BY_VALUE}</a>
							<ul class="dropdown-menu dropdown-menu-end">
								<li>
									<a class="dropdown-header">{$SORT_BY}</a>
								</li>
								{foreach from=$SORT_TYPES item=item}
									<li>
										<a href="{$item.link}" class="dropdown-item">{$item.sort}</a>
									</li>
								{/foreach}
							</ul>
						</div>
						{if isset($NEW_RESOURCE)}
							<a href="{$NEW_RESOURCE_LINK}" class="btn btn-primary btn-sm">{$NEW_RESOURCE}</a>
						{/if}
					</div>
				</div>
			{/if}
		</div>
	</div>

{/block}