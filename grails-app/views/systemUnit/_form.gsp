<%@ page import="ru.gbuz.ao.privolgie.app.inventory.SystemUnit" %>



<div class="fieldcontain ${hasErrors(bean: systemUnitInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="systemUnit.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: systemUnitInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: systemUnitInstance, field: 'inventNumber', 'error')} ">
    <label for="inventNumber">
        <g:message code="systemUnit.inventNumber.label" default="Invent Number"/>

    </label>
    <g:textField name="inventNumber" value="${fieldValue(bean: systemUnitInstance, field: 'inventNumber')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: systemUnitInstance, field: 'definition', 'error')} ">
    <label for="definition">
        <g:message code="systemUnit.definition.label" default="Definition"/>

    </label>
    <g:textField name="definition" value="${fieldValue(bean: systemUnitInstance, field: 'definition')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: systemUnitInstance, field: 'arm', 'error')} ">
    <label for="arm">
        <g:message code="systemUnit.arm.label" default="Arm"/>

    </label>
    <g:select name="arm.id" from="${ru.gbuz.ao.privolgie.app.inventory.ARM.list()}" optionKey="id"
              value="${systemUnitInstance?.arm?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: systemUnitInstance, field: 'stickerWindows', 'error')} ">
    <label for="stickerWindows">
        <g:message code="systemUnit.stickerWindows.label" default="Sticker Windows"/>

    </label>
    <g:checkBox name="stickerWindows" value="${systemUnitInstance?.stickerWindows}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: systemUnitInstance, field: 'accessories', 'error')} ">
    <label for="accessories">
        <g:message code="systemUnit.accessories.label" default="Accessories"/>

    </label>

    <ul>
        <g:each in="${systemUnitInstance?.accessories}" var="computerAccessoryInstance">
            <li><g:link controller="computerAccessory" action="show"
                        id="${computerAccessoryInstance.id}">${computerAccessoryInstance?.encodeAsHTML()}</g:link></li>
        </g:each>
    </ul>
    <g:link controller="computerAccessory" params="['systemUnit.id': systemUnitInstance?.id]" action="create"><g:message
            code="computerAccessory.new" default="New ComputerAccessory"/></g:link>

</div>

