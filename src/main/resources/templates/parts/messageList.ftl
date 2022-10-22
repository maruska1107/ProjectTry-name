<#include "security.ftl">
<#import "pager.ftl" as p>

<@p.pager url page />
<div class="card-columns ">
    <#list page.content as message>

        <div class="card ">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top">
            </#if>
            <div class="m-2">
                <#if isAdmin>
                <span>${message.id}</span><br/>
                </#if>
                <span>${message.text}</span><br/><br/>
                <i>Причина обращения: ${message.tag}</i>
            </div >


            <#if isAdmin>
            <div class="card-footer">
                <a href="/user-messages/${message.author.id}">${message.authorName} </a>
                <#if message.author.id == currentUserId>
                </#if>
                <a href="#" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">Change</a>


                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit request</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">

                    <a href="/user-messages/${message.author.id}">${message.authorName} </a>

                </div>
                <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                      </div>
                    </div>
                  </div>
                </div>

            </div>
            </#if>
        </div>
    <#else>
        No message
    </#list>
</div>

<@p.pager url page />