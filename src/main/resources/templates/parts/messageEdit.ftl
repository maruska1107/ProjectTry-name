<#include "security.ftl">
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group mt-3 visibility: hidden">
        <form method="post" enctype="multipart/form-data" >


<h5 class="card-title">Редактирование заявки</h5>
<div class="container">
  <div class="row">

    <div class="col-6">
        <div class="list-group my-4">
            <li class="list-group-item list-group-item-success">Информация о пользователе</li>
            <li class="list-group-item">${message.authorName}</li>
            <li class="list-group-item">${message.authorNname}</li>
            <li class="list-group-item">${message.authorFamily}</li>
            <li class="list-group-item">${message.authorPatronymic}</li>
            <li class="list-group-item">${message.authorEmail}</li>
            <li class="list-group-item">${message.authorNumber}</li>
            <li class="list-group-item">${message.authorAdress}</li>
        </div>
    </div>

    <div class="col-6">
        <div class="list-group my-4">
            <li class="list-group-item list-group-item-info">Информация по заявке</li>
            <li class="list-group-item">${message.id}</li>
            <li class="list-group-item">${message.text}</li>
            <li class="list-group-item">${message.tag}</li>
        </div>
    </div>


    <div class="col-6">
        <div class="list-group my-4">
            <li class="list-group-item list-group-item-warning">Информация о сотруднике</li>
            <li class="list-group-item"><#if message.employeeName!="<none>">${message.employeeName}<#else>Пусто</#if></li>
            <li class="list-group-item"><#if message.employeeNname!="<none>">${message.employeeNname}<#else>Пусто</#if></li>
            <li class="list-group-item"><#if message.employeeFamily!="<none>">${message.employeeFamily}<#else>Пусто</#if></li>
            <li class="list-group-item"><#if message.employeePatronymic!="<none>">${message.employeePatronymic}<#else>Пусто</#if></li>
            <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Назначить сотрудника
            </button>

            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />

            <div class="form-group">
                <button type="submit" class="btn btn-primary">Save message</button>
            </div>
                <div class="dropdown-menu">
                    <#list users as user>
                    <a class="dropdown-item" href="/edit-messages/${user.id}?message=${message.id}">${user.id} ${user.username}</a>
                    </#list>
                </div>
        </div>
    </div>
</form>

</div>
    </div>
</div>
