<#include "security.ftl">

<nav class="navbar navbar-expand-lg navbar-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navb" name="status">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link border border-success" href="/statusNew">Новые</a>
            </li>
            <li class="nav-item">
                <a class="nav-link border border-warning" href="/statusActive">Активные</a>
            </li>
            <li class="nav-item">
                <a class="nav-link border border-danger" href="/statusDone">Завершённые</a>
            </li>
        </ul>
    </div>
</nav>