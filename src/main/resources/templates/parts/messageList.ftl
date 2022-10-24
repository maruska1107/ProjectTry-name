<#include "security.ftl">
<#import "pager.ftl" as p>
<@p.pager url page />

<div class="card-columns" id="message-list">
    <#list page.content as message>
        <div class="card my-3" data-id="${message.id}">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top" />
            </#if>
            <div class="m-2">
                <span>${message.text}</span><br/><br/>
                <i>Причина обращения: ${message.tag}</i>
            </div>

    <#if isAdmin>
            <div class="card-footer text-muted container">
                <div class="row">
                    <a class="col text-warning align-self-center" href="/user-messages/${message.author.id}">${message.authorName}</a>

                        <a class="col btn btn-success" href="/edit-messages/${message.author.id}?message=${message.id}">
                            Редактировать
                        </a>
                </div>
            </div>
    </#if>

        </div>
    <#else>
        Сообщений нет
    </#list>
</div>

<@p.pager url page />