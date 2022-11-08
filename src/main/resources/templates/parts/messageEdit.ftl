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
                    <a class="dropdown-item" href="/edit-messages/${user}">${user.id} ${user.username}</a>
                    </#list>
                </div>
    </div>
  </div>
</div>
</div>




<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Message editor
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.text}</#if>" name="text" placeholder="Введите сообщение" />
                <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control"
                       value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг">
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Save message</button>
            </div>
        </form>
    </div>
</div>
