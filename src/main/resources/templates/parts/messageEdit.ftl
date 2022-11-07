<div class="collapse <#if message??>show</#if>" id="collapseExample">
<div class="text-center">
<h5 class="card-title">Редактирование заявки</h5>
</div>

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
            <li class="list-group-item">Dapibus ac facilisis in</li>
            <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Назначить сотрудника
            </button>
              <div class="dropdown-menu">
                    <#list users as user>
                    <a class="dropdown-item" href="#">${message}</a>
                    </#list>
        </div>
    </div>

  </div>
</div>












<ul class="list-group list-group-light">
  <li class="list-group-item d-flex justify-content-between align-items-center">
    <div>
      <div class="fw-bold">John Doe</div>

    </div>
    <span class="badge rounded-pill badge-success">Active</span>
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center">
    <div>
      <div class="fw-bold">Alex Ray</div>

    </div>
    <span class="badge rounded-pill badge-primary">Onboarding</span>
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center">
    <div>
      <div class="fw-bold">Kate Hunington</div>
    </div>
    <span class="badge rounded-pill badge-warning">Awaiting</span>
  </li>
</ul>

</div>