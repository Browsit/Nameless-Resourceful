{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <div class="card">
                <div class="card-header header-theme">{$RESOURCES}
                    {if isset($NEW_RESOURCE)}
                        <a href="{$NEW_RESOURCE_LINK}" class="btn btn-theme float-right">{$NEW_RESOURCE}</a>
                    {/if}
                    <div class="dropdown float-right">
                        <button class="btn btn-theme btn-sm float-right dropdown-toggle mr-2" type="button"
                            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            {$SORT_BY} {$SORT_BY_VALUE}
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            {foreach from=$SORT_TYPES item=item}
                                <a rel="noopener nofollow" class="dropdown-item" href="{$item.link}">{$item.sort}</a>
                            {/foreach}
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    {if $LATEST_RESOURCES}
                        <div class="table-responsive mb-3">
                        <table class="table table-striped resources-table mb-2">
                            <colgroup>
                                <col span="1" style="width: 60%;">
                                <col span="1" style="width: 20%;" class="d-none d-lg-table-column">
                                <col span="1" style="width: 20%;" class="d-none d-lg-table-column">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>{$RESOURCE}</th>
                                    <th class="d-none d-lg-table-cell">{$STATS}</th>
                                    <th class="d-none d-lg-table-cell">{$AUTHOR}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$LATEST_RESOURCES item=resource}
                                    <tr>
                                        <td>
                                            <div class="d-flex">
                                                <img src="{$resource.icon}" style="width: 60px; height: 100%">
                                                <div class="ml-3 flex-grow-1">
                                                    {if isset($resource.price)}<span
                                                            class="badge badge-dark float-right">{$resource.price}
                                                        {$CURRENCY}</span>
                                                        {if isset($resource.discount)}
                                                            <span class="badge badge-success float-right" style="margin-left:5px;">{$resource.discount}% off</span>
                                                        {/if}
                                                    {/if}
                                                    <a class="white-link" href="{$resource.link}">{$resource.name}</a>
                                                    <small>{$resource.version}</small><br />
                                                    {if $resource.short_description}
                                                        {$resource.short_description}
                                                    {else}
                                                        {$resource.description}
                                                    {/if}
                                                    <br />
                                                    <small>{$resource.category}, <span data-toggle="tooltip"
                                                            data-trigger="hover"
                                                            data-original-title="{$resource.updated_full}">{$resource.updated}</span></small>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="d-none d-lg-table-cell">
                                            <div class="star-rating view">
                                                <span class="far fa-star" data-rating="1"></span>
                                                <span class="far fa-star" data-rating="2"></span>
                                                <span class="far fa-star" data-rating="3"></span>
                                                <span class="far fa-star" data-rating="4"></span>
                                                <span class="far fa-star" data-rating="5"></span>
                                                <input type="hidden" name="rating" class="rating-value"
                                                    value="{$resource.rating}">
                                            </div>
                                            {$resource.views}<br /> {$resource.downloads}
                                        </td>
                                        <td class="d-none d-lg-table-cell">
                                            <a href="{$resource.author_profile}"><img class="avatar-img"
                                                    style="max-height:20px; max-width:20px;" src="{$resource.author_avatar}"
                                                    alt="{$resource.author}" /></a> <a style="{$resource.author_style}"
                                                href="{$resource.author_profile}">{$resource.author}</a>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                        </div>
                    {$PAGINATION} {else} {$NO_RESOURCES} 
                    {/if}
                </div>
            </div>
        </div>
        <div class="col-md-3">
            {include file='resources/categories.tpl'}

            {if count($WIDGETS_RIGHT)}
                {foreach from=$WIDGETS_RIGHT item=widget}
                    {$widget}
                {/foreach}
            {/if}
        </div>
    </div>
</div>
{include file='footer.tpl'}