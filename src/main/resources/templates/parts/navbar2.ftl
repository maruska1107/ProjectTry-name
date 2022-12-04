<#include "security.ftl">
<#if isUser || isAdmin>
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="collapse navbar-collapse" id="navb" name="status">
        <ul class="navbar-nav mr-auto">
            <#if isUser>
            <li class="nav-item mx-1">
                <a class="nav-link border border-info text-body" href="/user-messages/${currentUserId}">Все</a>
            </li>
            <li class="nav-item mx-1">
                <a class="nav-link border border-warning text-body" href="/statusActiveUser">Активные</a>
            </li>
            </#if>
            <#if isAdmin>
            <li class="nav-item mx-1">
                <a class="nav-link active border border-success text-body" href="/statusNew">Новые</a>
            </li>

            <li class="nav-item mx-1">
                <a class="nav-link border border-warning text-body" href="/statusActive">Активные</a>
            </li>
            <li class="nav-item mx-1">
                <a class="nav-link border border-danger text-body" href="/statusDone">Завершённые</a>
            </li>
            <li class="nav-item mx-1">
                <a class="nav-link border border-danger text-body" href="/statusDoneByEmployee">Отказанные</a>
            </li>
            </#if>
        </ul>
    </div>
</nav>
</#if>