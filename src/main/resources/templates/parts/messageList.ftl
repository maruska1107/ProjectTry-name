
<#include "navbar2.ftl">
<#include "security.ftl">
<#import "pager.ftl" as p>

<@p.pager url page />
<#if isUser>
<div class="dropdown">
  <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
    <i class="icon-user"></i> Сортировать по
    <span class="caret"></span>
  </a>
  <ul class="dropdown-menu" role="menu" ">
    <li><a class="dropdown-item" href="/user-messages/${currentUserId}">  По возрастанию даты</a></li>
    <li><a class="dropdown-item" href="/sort-messages/${currentUserId}">  По убыванию даты</a></li>
  </ul>
</div>
</#if>

<div class="card-columns" id="message-list">
    <#list page.content as message>
        <div class="card my-3" data-id="${message.id}">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top" />
            </#if>
            <div class="m-2">
                <span>${message.text}</span><br/><br/>
                <i> Причина обращения: ${message.tag}</i><br/>
                <i> Дата обращения: ${message.data}</i><br/>
                <span class="badge rounded-pill badge-danger"><#if message.status == "Завершён">${message.status}</#if></span>
                <span class="badge rounded-pill badge-warning"><#if message.status == "В процессе">${message.status}</#if></span>
                <span class="badge rounded-pill badge-info"><#if message.status == "Отправлено">${message.status}</#if></span>
                <span class="badge rounded-pill badge-danger"><#if message.status == "Отказано сотрудником">${message.status}</#if></span>
            </div>
            <div class="card-footer text-muted container">
                <div class="row">

                    <a class="col text-warning align-self-center" href="/user-messages/${message.author.id}">${message.authorName}</a>
                    <#if isAdmin>
                        <a class="col btn btn-success" href="/edit-messages/${message.author.id}?message=${message.id}">
                            Подробнее...
                        </a>
                        </#if>
                        <#if isEmployee>
                            <a class="col btn btn-success" href="/edit-status/${message.author.id}/${message.status}?message=${message.id}">
                            Изменить статус
                        </a>
                        </#if>
                </div>
                <div class="row">
                <a class="col text-info align-self-left" href="">${message.employeeName}</a></div>
            </div>

        </div>
    <#else>
        Сообщений нет
    </#list>
</div>

<@p.pager url page />