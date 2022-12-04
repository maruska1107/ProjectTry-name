<#import "parts/common.ftl" as c>

<@c.page>
Список пользователей

<table  class="table">
<thead>
<tr>
<th scope="col">Name</th>
<th scope="col">User name</th>
<th scope="col">Family</th>
<th scope="col">Patronymic</th>
<th scope="col">Email</th>
<th scope="col">Phone</th>
<th scope="col">Address</th>
<th scope="col">Role</th>


<th></th>
</tr>
</thead>
<tbody>
<#list users as user>
<tr>
<td>${user.username}</td>

<td>${user.name}</td>
<td>${user.family}</td>
<td>${user.patronymic}</td>
<td>${user.email}</td>
<td>${user.phone}</td>
<td>${user.address}</td>
<td><#list user.roles as role>${role}<#sep>, </#list></td>
<td><a href="/user/${user.id}">edit</a></td>
        </tr>
    </#list>
    </tbody>
</table>
</@c.page>