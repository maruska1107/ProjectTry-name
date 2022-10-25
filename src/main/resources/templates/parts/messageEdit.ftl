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
            <div class="input-group" >
               <select class="form-select" value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг"> id="inputGroupSelect01">
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
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Выбрать файл</label>
                </div>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Сохранить сообщение</button>
            </div>
        </form>
    </div>
</div>