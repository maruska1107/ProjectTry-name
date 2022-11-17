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
<#if isEmployee>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
<button type="submit" class="col btn btn-success" href="/edit-status/${user.id}?message=${message.id}">
    Отказаться
</a>
<input type="hidden" name="_csrf" value="${_csrf.token}" />
<button type="submit" class="col btn btn-success" href="/add-status/${user.id}?message=${message.id}">
    Принять
</a>
</#if>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />

        </div>
    </div>
</form>
</div>
    </div>
</div>
