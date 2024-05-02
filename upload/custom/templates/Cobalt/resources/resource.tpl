{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <div class="card">
                <div class="card-header header-theme">
                    <div class="d-flex">
                        <img src="{$RESOURCE_ICON}" alt="{$RESOURCE_NAME}" style="height: 60px">
                        <div class="flex-grow-1 ml-3">
                            {$VIEWING_RESOURCE}<br />[{$RELEASE_TAG}] {$RESOURCE_SHORT_DESCRIPTION}
                        </div>
                        <div class="resource-btns">
                            {if isset($CAN_UPDATE)}
                            <a href="{$UPDATE_LINK}" class="btn btn-theme mb-2">{$UPDATE}</a> {/if}
                            <a href="{$BACK_LINK}" class="btn btn-theme mb-2">{$RESOURCE_INDEX}</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">

                    <ul class="nav nav-tabs resource-tabs mb-2" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="btn btn-secondary profile-btn mr-2 active"
                                href="{$OVERVIEW_LINK}">{$OVERVIEW_TITLE}</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-secondary profile-btn mr-2"
                                href="{$OTHER_RELEASES_LINK}">{$RELEASES_TITLE}</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-secondary profile-btn mr-2" href="{$VERSIONS_LINK}">{$VERSIONS_TITLE}</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-secondary profile-btn mr-2" href="{$REVIEWS_LINK}">{$REVIEWS_TITLE}</a>
                        </li>
                    </ul>

                    {$DESCRIPTION}
                    <br />{if $HAS_CONTRIBUTORS eq 1}{$CONTRIBUTORS}{/if}
                    <hr />
                    {if isset($LOG_IN_TO_DOWNLOAD)}
                        <button disabled class="btn btn-theme">{$LOG_IN_TO_DOWNLOAD}</button>
                    {/if}
                    {if isset($DOWNLOAD_URL)}
                        <a href="{$DOWNLOAD_URL}" class="btn btn-theme" target="_blank">{$DOWNLOAD}</a>
                    {elseif isset($PURCHASE_FOR_PRICE)}
                        <a {if isset($PURCHASE_LINK)}href="{$PURCHASE_LINK}" {else}disabled{/if}class="btn btn-theme">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-fill" viewBox="0 0 16 16">
                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                            </svg>
                            {$PURCHASE_FOR_PRICE}
                        </a>
                    {elseif isset($PAYMENT_PENDING)}
                        <button type="button" disabled class="btn btn-theme">{$PAYMENT_PENDING}</button>
                    {/if}
                    <span class="float-right">
                        {if isset($CAN_EDIT)}
                            <a href="{$EDIT_LINK}" class="btn btn-secondary">{$EDIT}</a>
                            <a data-toggle="modal" data-target="#modal-icon-upload"
                                class="btn btn-secondary">{$CHANGE_ICON}</a>
                        {/if}
                        {if isset($MODERATION) && count($MODERATION)}
                            <div class="btn-group dropup">
                                <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">{$MODERATION_TEXT}</button>
                                <div class="dropdown-menu">
                                    {foreach from=$MODERATION item=item}
                                        <a class="dropdown-item" href="{$item.link}">{$item.title}</a>
                                    {/foreach}
                                </div>
                            </div>
                        {/if}
                        <a href="{$OTHER_RELEASES_LINK}" class="btn btn-secondary">{$OTHER_RELEASES}</a>
                    </span>
                </div>
            </div>
            <div class="card">
                <div class="card-header header-theme">{$REVIEWS}</div>
                <div class="card-body">
                    {if count($COMMENT_ARRAY)}
                        {foreach from=$COMMENT_ARRAY item=comment}
                            <div class="card">
                                <div class="card-body">
                                    {$comment.content}
                                    {if isset($DELETE_REVIEW)}
                                        <br /><br /><span class="pull-right"><a href="{$comment.delete_link}"
                                                onclick="return confirm('{$CONFIRM_DELETE_REVIEW}');">{$DELETE_REVIEW} <i class="fa-solid fa-trash"></i></a></span><br /> {/if}
                                    <hr />
                                    <div class="star-rating view d-inline">
                                        <span class="far fa-star" data-rating="1"></span>
                                        <span class="far fa-star" data-rating="2"></span>
                                        <span class="far fa-star" data-rating="3"></span>
                                        <span class="far fa-star" data-rating="4"></span>
                                        <span class="far fa-star" data-rating="5"></span>
                                        <input type="hidden" name="rating" class="rating-value" value="{$comment.rating}">
                                    </div> | {$comment.release_tag} | <span data-toggle="tooltip"
                                        data-original-title="{$comment.date_full}">{$comment.date}</span>
                                    <span class="float-right">
                                        <a href="{$comment.user_profile}"><img class="avatar-img" src="{$comment.user_avatar}"
                                                style="height:20px;width:20px;" alt="{$comment.username}" /></a> <a
                                            href="{$comment.user_profile}" style="{$comment.user_style}">{$comment.username}</a>
                                    </span>
                                </div>
                            </div>
                        {/foreach} {$PAGINATION}
                    {else}
                        {$NO_REVIEWS}
                    {/if}
                    {if $CAN_REVIEW == true && !isset($PAYMENT_PENDING) && !isset($PURCHASE_FOR_PRICE)}
                    </div>
                    <div class="card-header header-theme">{$NEW_REVIEW}</div>
                    <div class="card-body">
                        <form action="" method="post">
                            <div class="form-group">
                                <div class="star-rating set">
                                    <span class="far fa-star" data-rating="1"></span>
                                    <span class="far fa-star" data-rating="2"></span>
                                    <span class="far fa-star" data-rating="3"></span>
                                    <span class="far fa-star" data-rating="4"></span>
                                    <span class="far fa-star" data-rating="5"></span>
                                    <input type="hidden" name="rating" class="rating-value" value="0">
                                </div>
                            </div>
                            <div class="form-group">
                                <textarea style="width:100%" name="content" id="editor" rows="15"></textarea>
                            </div>
                            <div class="form-group mb-0">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                            </div>
                        </form>
                    {/if}
                </div>
            </div>
        </div>
        <div class="col-md-3">

            <div class="card">
                <div class="card-header header-theme">{$RESOURCE}</div>
                <div class="card-body" style="font-size: 0.9rem;">
                    <div class="item">
                        <span class="text">{$VIEWS}</span>
                        <div class="description float-right"><b>{$VIEWS_VALUE}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$TOTAL_DOWNLOADS}</span>
                        <div class="description float-right"><b>{$TOTAL_DOWNLOADS_VALUE}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$FIRST_RELEASE}</span>
                        <div class="description float-right"><b>{$FIRST_RELEASE_DATE}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$LAST_RELEASE}</span>
                        <div class="description float-right"><b>{$LAST_RELEASE_DATE}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$CATEGORY}</span>
                        <div class="description float-right"><b>{$CATEGORY_VALUE}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$RATING}</span>
                        <div class="description float-right">
                            <div class="star-rating view">
                                <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                                <span class="far fa-star" data-rating="2" style="color:gold"></span>
                                <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                                <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                                <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                                <input type="hidden" name="rating" class="rating-value" value="{$RATING_VALUE}">
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="card">
                <div class="card-header header-theme">{$RELEASE_VERSION}</div>
                <div class="card-body" style="font-size: 0.9rem;">

                    <div class="item">
                        <span class="text">{$DOWNLOADS}</span>
                        <div class="description float-right"><b>{$RELEASE_DOWNLOADS}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$RELEASE}</span>
                        <div class="description float-right"><b>{$RELEASE_DATE_FULL}</b></div>
                    </div>
                    <div class="item">
                        <span class="text">{$RATING}</span>
                        <div class="description float-right">
                            <div class="star-rating view">
                                <span class="far fa-star" data-rating="1" style="color:gold;"></span>
                                <span class="far fa-star" data-rating="2" style="color:gold"></span>
                                <span class="far fa-star" data-rating="3" style="color:gold;"></span>
                                <span class="far fa-star" data-rating="4" style="color:gold;"></span>
                                <span class="far fa-star" data-rating="5" style="color:gold;"></span>
                                <input type="hidden" name="rating" class="rating-value" value="{$RELEASE_RATING}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header header-theme">{$AUTHOR}</div>
                <div class="card-body text-center">
                    <a href="{$AUTHOR_PROFILE}"><img src="{$AUTHOR_AVATAR}" class="avatar-img"
                                alt="{$AUTHOR_NICKNAME}" style="max-height:80px; max-width:80px;" /></a><br />
                        <a class="username d-inline-block mt-2 mb-4" href="{$AUTHOR_PROFILE}" style="{$AUTHOR_STYLE}">{$AUTHOR_NICKNAME}</a>
                    <a class="btn btn-secondary btn-block" href="{$AUTHOR_RESOURCES}">&raquo; {$VIEW_OTHER_RESOURCES}</a>
                </div>
            </div>
        </div>
    </div>
</div>

{if isset($CAN_EDIT)}
    <div class="modal fade" id="modal-icon-upload" tabindex="-1" role="dialog" aria-labelledby="modal-icon-uploadLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title" id="modal-icon-uploadLabel">{$CHANGE_ICON}</span>
                </div>
                <div class="modal-body">
                    <form action="{$CHANGE_ICON_ACTION}" method="post" enctype="multipart/form-data"
                        id="form-resource-icon">
                        <input type="file" name="file" id="uploadFileButton" hidden
                            onchange="$('#fileName').html(this.files[0].name)" />
                        <label class="btn btn-secondary" for="uploadFileButton">
                            <i class="fa-solid fa-cloud-arrow-up"></i> <span id="fileName">{$UPLOAD_ICON}</span>
                        </label>
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <input type="hidden" name="resource_id" value="{$RESOURCE_ID}" />
                    </form>
                    <a class="btn btn-theme mt-3" onclick="$('#form-resource-icon').submit();">{$SUBMIT}</a>
                    <button class="btn btn-secondary mt-3" data-dismiss="modal">{$CANCEL}</button>
                </div>
            </div>
        </div>
    </div>
{/if}

{include file='footer.tpl'}