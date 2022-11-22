<#include "security.ftl">

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
		</div>
	</div>

<div class="container">
    <div class="row align-items-center">
    <div class="col">
        <form action="/edit-status/${user.id}/${"Отказано"}?message=${message.id}" method="post">
			<#if isEmployee>
			    <input type="hidden" name="_csrf" value="${_csrf.token}" />
				<button class="col btn btn-danger" href="/edit-status/${user.id}/${message.status}?message=${message.id}">
			    	Отказаться
				</button>
			</#if>
		        <input type="hidden" name="_csrf" value="${_csrf.token}" />
		        <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />
		</form>
        </div>

        <div class="col">
		<form action="/edit-status/${user.id}/${"Завершён"}?message=${message.id}" method="post">
			<#if isEmployee>
		    	<input type="hidden" name="_csrf" value="${_csrf.token}" />
				<button class="col btn btn-success" href="/edit-status/${user.id}/${message.status}?message=${message.id}">
		    		Выполнено
				</button>
			</#if>
		          <input type="hidden" name="_csrf" value="${_csrf.token}" />
		          <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />
		</form>
        </div>
    </div>
</div>