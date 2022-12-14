<#include "security.ftl">
<#macro login path isRegisterForm>
<div class="container col-12">
<form action="${path}" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Имя пользователя :</label>
        <div class="col-sm-6">
            <input type="text" name="username" class="form-control" placeholder="User name" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Пароль:</label>
        <div class="col-sm-6">
            <input type="password" name="password" class="form-control" placeholder="Password" />
        </div>
    </div>


<#if isRegisterForm>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Имя:</label>
        <div class="col-sm-6">
            <input type="text" name="name" class="form-control" placeholder="Name" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Фамилия:</label>
        <div class="col-sm-6">
            <input type="text" name="family" class="form-control" placeholder="Family" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Отчество:</label>
        <div class="col-sm-6">
            <input type="text" name="patronymic" class="form-control" placeholder="Patronymic" />
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-6">
            <input type="email" name="email" class="form-control" placeholder="email" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Телефон:</label>
        <div class="col-sm-6">
            <input type="text" name="phone" class="form-control" placeholder="Phone" />
        </div>
    </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Адрес:</label>
            <div class="col-sm-6 mb-2">
                <input type="text" name="address" class="form-control" placeholder="Address" />
            </div>
        </div>
</#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <#if !isRegisterForm><a href="/registration">Зарегистрироваться</a></#if>
    <button class="btn btn-primary ml-1" type="submit"><#if isRegisterForm>Зарегистрироваться<#else>Войти</#if></button>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-primary" type="submit"><#if name == "unknown">Войти<#else>Выйти</#if></button>
</form>
</div>
</#macro>