<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>


<@c.page>
<#if isAdmin>

<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>
</#if>

<#if isUser>

<div>
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control" name="text" placeholder="Введите сообщение" />
            </div>



            <div class="input-group">
              <select class="form-select" id="inputGroupSelect01" name="tag">
                <option selected>Выберите...</option>
                <option value="Установка компьютера">Установка компьютера</option>
                <option value="Ремонт компьютера">Ремонт компьютера</option>
                <option value="Диагностика компьютера">Диагностика компьютера</option>
                <option value="Установка ОС">Установка ОС</option>
                <option value="Установка программ">Установка программ</option>
                <option value="Подключение к Интернету">Подключение к Интернету</option>
                <option value="Срочный ремонт компьютеров">Срочный ремонт компьютеров</option>
              </select>
            </div>


            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>

</#if>
<#if isAdmin>
    <#include "parts/messageList.ftl" />
</#if>
</@c.page>