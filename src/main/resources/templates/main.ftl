<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<@c.page>
<#if isAdmin>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
        <div class="input-group">
              <select class="custom-select" id="inputGroupSelect01" name="filter">
                <option selected>Поиск по причине</option>
                <option value="Установка компьютера">Установка компьютера</option>
                <option value="Ремонт компьютера">Ремонт компьютера</option>
                <option value="Диагностика компьютера">Диагностика компьютера</option>
                <option value="Установка ОС">Установка ОС</option>
                <option value="Установка программ">Установка программ</option>
                <option value="Подключение к Интернету">Подключение к Интернету</option>
                <option value="Срочный ремонт компьютеров">Срочный ремонт компьютеров</option>
              </select>
        </div>
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
</div>

</#if>

<#if isUser>
<div class="container col-9">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">

            <div class="form-group">
              <div class="form-group-prepend">
                <span class="form-group-text ">Текст сообщения</span>
              </div>
              <textarea class="form-control" maxlength="256" name="text" aria-label=""></textarea>
            </div>

              <select class="custom-select form-select-lg mb-3" " id="inputGroupSelect01" name="tag">
                <option selected>Причина обращения</option>
                <option value="Установка компьютера">Установка компьютера</option>
                <option value="Ремонт компьютера">Ремонт компьютера</option>
                <option value="Диагностика компьютера">Диагностика компьютера</option>
                <option value="Установка ОС">Установка ОС</option>
                <option value="Установка программ">Установка программ</option>
                <option value="Подключение к Интернету">Подключение к Интернету</option>
                <option value="Срочный ремонт компьютеров">Срочный ремонт компьютеров</option>
                <option value="Другое...">Другое...</option>
              </select>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Выбрать файл</label>
                </div>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="form-group">
                <button type="submit" class="btn btn-warning">Отправить заявку</button>
            </div>
        </form>
    </div>
</div>

</#if>
<#if isAdmin>

    <#include "parts/messageList.ftl" />
</#if>
</@c.page>