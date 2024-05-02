{extends file="layout.tpl"}

{block name=heading}

	<div class="d-flex align-items-center flex-wrap mb-4">
		<div class="d-flex align-items-center">
			<div class="me-3">
				<img src="{$RESOURCE_ICON}" alt="{$RESOURCE_NAME}" style="width: 64px; height: 64px; border-radius: var(--avatars-border-radius);">
			</div>
			<div>
				<h2>{$VIEWING_RESOURCE} <small>[{$RELEASE_TAG}]</small></h2>
				<div class="meta">
					{$RESOURCE_SHORT_DESCRIPTION}
				</div>
			</div>
		</div>
		<div class="ms-auto">
			<a href="{$BACK_LINK}" class="btn btn-secondary me-2">{$RESOURCE_INDEX}</a>
			{if isset($LOG_IN_TO_DOWNLOAD)}
				<a class="btn btn-primary disabled">{$LOG_IN_TO_DOWNLOAD}</a>
			{/if}
			{if isset($DOWNLOAD_URL)}
				<a href="{$DOWNLOAD_URL}" class="btn btn-primary">{$DOWNLOAD}</a>
			{else if isset($PURCHASE_FOR_PRICE)}
				<a href="{if isset($PURCHASE_LINK)}{$PURCHASE_LINK}{else}#{/if}" class="btn btn-primary{if !isset($PURCHASE_LINK)} disabled{/if}">
				    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                    </svg>
                    {$PURCHASE_FOR_PRICE}
                </a>
			{else if isset($PAYMENT_PENDING)}
				<a class="btn btn-primary disabled">{$PAYMENT_PENDING}</a>
			{/if}
		</div>
	</div>


{/block}

{block name=content}

	<div class="row">
		<div class="col-xl-9 col-lg-8">
			<div class="action-bar">
				<div class="action-bar-buttons">
					<a href="{$OTHER_RELEASES_LINK}" class="btn btn-secondary btn-sm">{$OTHER_RELEASES}</a>
					{if isset($CAN_EDIT)}
						<a href="{$EDIT_LINK}" class="btn btn-secondary btn-sm">{$EDIT}</a>
						<a href="#modal-changeIcon" class="btn btn-secondary btn-sm" data-bs-toggle="modal">{$CHANGE_ICON}</a>
					{/if}
					{if !empty($MODERATION)}
						<div class="dropdown">
							<a href="#" class="btn btn-secondary btn-sm dropdown-toggle" data-bs-toggle="dropdown">{$MODERATION_TEXT}</a>
							<ul class="dropdown-menu dropdown-menu-end">
								<li>
									<a class="dropdown-header">{$MODERATION_TEXT}</a>
								</li>
								{foreach from=$MODERATION item=item}
									<li>
										<a href="{$item.link}" class="dropdown-item">{$item.title}</a>
									</li>
								{/foreach}
							</ul>
						</div>
					{/if}
					{if isset($CAN_UPDATE)}
						<a href="{$UPDATE_LINK}" class="btn btn-primary btn-sm">{$UPDATE}</a>
					{/if}
				</div>
			</div>
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a href="{$OVERVIEW_LINK}" class="nav-link active">{$OVERVIEW_TITLE}</a>
				</li>
				<li class="nav-item">
					<a href="{$OTHER_RELEASES_LINK}" class="nav-link">{$RELEASES_TITLE}</a>
				</li>
				<li class="nav-item">
					<a href="{$VERSIONS_LINK}" class="nav-link">{$VERSIONS_TITLE}</a>
				</li>
				<li class="nav-item">
					<a href="{$REVIEWS_LINK}" class="nav-link">{$REVIEWS_TITLE}</a>
				</li>
			</ul>
			<div class="card">
				<div class="card-body">
					<div class="post">
						{$DESCRIPTION}
					</div>
					{if !empty($RESOURCE_CONTRIBUTORS)}
						<div class="meta-block meta-block-bottom">
							<div class="meta">
								{$CONTRIBUTORS} {$RESOURCE_CONTRIBUTORS}
							</div>
						</div>
					{/if}
				</div>
			</div>
			{if !empty($COMMENT_ARRAY)}
				<div class="card">
					<div class="card-body">
						<h3>{$REVIEWS}</h3>
						{foreach from=$COMMENT_ARRAY item=comment}
							<div class="message">
								<div class="message-icon">
									<a href="{$comment.user_profile}">
										<img src="{$comment.user_avatar}" alt="{$comment.username}">
									</a>
								</div>
								<div class="message-content">
									<div class="message-title">
										<div class="star-rating view float-end">
											<span class="far fa-star" data-rating="1"></span>
											<span class="far fa-star" data-rating="2"></span>
											<span class="far fa-star" data-rating="3"></span>
											<span class="far fa-star" data-rating="4"></span>
											<span class="far fa-star" data-rating="5"></span>
											<input type="hidden" name="rating" class="rating-value" value="{$comment.rating}">
										</div>
										<a href="{$comment.user_profile}" style="{$comment.user_style}">{$comment.username}</a>
									</div>
									<div class="message-post">
										<div class="post">
											{$comment.content}
										</div>
									</div>
									<div class="message-meta">
										<div>
											{$comment.release_tag}
											&bull;
											<span data-toggle="tooltip" title="{$comment.date_full}">{$comment.date}</span>
										</div>
										{if isset($DELETE_REVIEW)}
											<ul class="message-actions">
												<li>
													<a href="{$comment.delete_link}" onclick="return confirm('{$CONFIRM_DELETE_REVIEW}');">{$DELETE_REVIEW}</a>
												</li>
											</ul>
										{/if}
									</div>
								</div>
							</div>
						{/foreach}
						<hr />
						<div class="text-end">
							{$PAGINATION}
						</div>
					</div>
				</div>
			{else}
				<div class="alert alert-danger mt-4">
					{$NO_REVIEWS}
				</div>
			{/if}
			{if ($CAN_REVIEW == true && !isset($PAYMENT_PENDING) && !isset($PURCHASE_FOR_PRICE))}
				<div class="card">
					<div class="card-body">
						<form action="" method="post">
							<div class="d-flex align-items-center mb-4">
								<h3>{$NEW_REVIEW}</h3>
								<div class="star-rating set ms-auto">
									<span class="far fa-star" data-rating="1"></span>
									<span class="far fa-star" data-rating="2"></span>
									<span class="far fa-star" data-rating="3"></span>
									<span class="far fa-star" data-rating="4"></span>
									<span class="far fa-star" data-rating="5"></span>
									<input type="hidden" name="rating" class="rating-value" value="0">
								</div>
							</div>
							{if !isset($MARKDOWN)}
								<div class="form-group">
									<textarea name="content" class="form-control" id="editor"></textarea>
								</div>
							{else}
								<div class="form-group">
									<textarea name="content" class="form-control" id="markdown"></textarea>
									<div class="meta">
										{$MARKDOWN_HELP}
									</div>
								</div>
							{/if}
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">{$SUBMIT}</button>
							</div>
							<input type="hidden" name="token" value="{$TOKEN}">
						</form>
					</div>
				</div>
			{/if}
		</div>
		<div class="col-xl-3 col-lg-4">
			<div class="card card-widget">
				<div class="card-header">
					{$RESOURCE}
				</div>
				<div class="card-body">
					<div class="pairs">
						<dl>
							<dt>{$VIEWS}</dt>
							<dd>{$VIEWS_VALUE}</dd>
						</dl>
						<dl>
							<dt>{$TOTAL_DOWNLOADS}</dt>
							<dd>{$TOTAL_DOWNLOADS_VALUE}</dd>
						</dl>
						<dl>
							<dt>{$FIRST_RELEASE}</dt>
							<dd>{$FIRST_RELEASE_DATE}</dd>
						</dl>
						<dl>
							<dt>{$LAST_RELEASE}</dt>
							<dd>{$LAST_RELEASE_DATE}</dd>
						</dl>
						<dl>
							<dt>{$CATEGORY}</dt>
							<dd>{$CATEGORY_VALUE}</dd>
						</dl>
						<dl>
							<dt>{$RATING}</dt>
							<dd>
								<div class="star-rating view">
									<span class="far fa-star" data-rating="1"></span>
									<span class="far fa-star" data-rating="2"></span>
									<span class="far fa-star" data-rating="3"></span>
									<span class="far fa-star" data-rating="4"></span>
									<span class="far fa-star" data-rating="5"></span>
									<input type="hidden" name="rating" class="rating-value" value="{$RATING_VALUE}">
								</div>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<div class="card card-widget">
				<div class="card-header">
					{$RELEASE_VERSION}
				</div>
				<div class="card-body">
					<div class="pairs">
						<dl>
							<dt>{$DOWNLOADS}</dt>
							<dd>{$RELEASE_DOWNLOADS}</dd>
						</dl>
						<dl>
							<dt>{$RELEASE}</dt>
							<dd>{$RELEASE_DATE_FULL}</dd>
						</dl>
						<dl>
							<dt>{$RATING}</dt>
							<dd>
								<div class="star-rating view">
									<span class="far fa-star" data-rating="1"></span>
									<span class="far fa-star" data-rating="2"></span>
									<span class="far fa-star" data-rating="3"></span>
									<span class="far fa-star" data-rating="4"></span>
									<span class="far fa-star" data-rating="5"></span>
									<input type="hidden" name="rating" class="rating-value" value="{$RELEASE_RATING}">
								</div>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<div class="card card-widget">
				<div class="card-header">
					{$AUTHOR}
				</div>
				<div class="card-body">
					<div class="user-item user-item-big">
						<div class="user-item-avatar">
							<a href="{$AUTHOR_PROFILE}">
								<img src="{$AUTHOR_AVATAR}" alt="{$AUTHOR_NICKNAME}">
							</a>
						</div>
						<div class="user-item-content">
							<a href="{$AUTHOR_PROFILE}" style="{$AUTHOR_STYLE}">{$AUTHOR_NICKNAME}</a>
							<div class="user-item-meta">
								<a href="{$AUTHOR_RESOURCES}">{$VIEW_OTHER_RESOURCES}</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	{if isset($CAN_EDIT)}
		<div class="modal fade" id="modal-changeIcon">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title">
							{$CHANGE_ICON}
						</div>
						<a href="#" class="close" data-bs-dismiss="modal">
							<i class="fas fa-times"></i>
						</a>
					</div>
					<form action="{$CHANGE_ICON_ACTION}" method="post" enctype="multipart/form-data">
						<div class="modal-body">
							<div class="form-group">
								<input type="file" class="form-control" id="input-resourceIconUpload" name="file">
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-secondary btn-sm" data-bs-dismiss="modal">{$CANCEL}</button>
							<button type="submit" class="btn btn-primary btn-sm">{$SUBMIT}</button>
						</div>
						<input type="hidden" name="token" value="{$TOKEN}">
						<input type="hidden" name="resource_id" value="{$RESOURCE_ID}">
					</form>
				</div>
			</div>
		</div>
	{/if}

{/block}