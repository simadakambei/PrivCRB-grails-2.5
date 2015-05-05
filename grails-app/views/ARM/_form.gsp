<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ARM" %>



<div class="fieldcontain ${hasErrors(bean: ARMInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="ARM.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" value="${fieldValue(bean: ARMInstance, field: 'name')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ARMInstance, field: 'cabinet', 'error')} ">
    <label for="cabinet">
        <g:message code="ARM.cabinet.label" default="Cabinet"/>

    </label>
    <g:select name="cabinet.id" from="${ru.gbuz.ao.privolgie.app.entity.Cabinet.list()}" optionKey="id"
              value="${ARMInstance?.cabinet?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ARMInstance, field: 'systemUnit', 'error')} ">
    <label for="systemUnit">
        <g:message code="ARM.systemUnit.label" default="System Unit"/>

    </label>
    <g:select name="systemUnit.id" from="${ru.gbuz.ao.privolgie.app.inventory.SystemUnit.list()}" optionKey="id"
              value="${ARMInstance?.systemUnit?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ARMInstance, field: 'externalAccessories', 'error')} ">
    <label for="externalAccessories">
        <g:message code="ARM.externalAccessories.label" default="External Accessories"/>

    </label>

    <ul>
        <g:each in="${ARMInstance?.externalAccessories}" var="externalAccessoryInstance">
            <li><g:link controller="externalAccessory" action="show"
                        id="${externalAccessoryInstance.id}">${externalAccessoryInstance?.encodeAsHTML()}</g:link></li>
        </g:each>
    </ul>
    <g:link controller="externalAccessory" params="['ARM.id': ARMInstance?.id]" action="create"><g:message
            code="externalAccessory.new" default="New ExternalAccessory"/></g:link>

</div>

<div class="fieldcontain ${hasErrors(bean: ARMInstance, field: 'specialist', 'error')} required">
    <label for="specialist">
        <g:message code="ARM.specialist.label" default="Specialist"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="specialist.id" from="${ru.gbuz.ao.privolgie.app.entity.Specialist.list()}" optionKey="id"
              value="${ARMInstance?.specialist?.id}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ARMInstance, field: 'workPlaces', 'error')} ">
    <label for="workPlaces">
        <g:message code="ARM.workPlaces.label" default="Work Places"/>

    </label>
    <g:select name="workPlaces"
              from="${ru.gbuz.ao.privolgie.vocs.WorkPlace.list()}"
              size="5" multiple="yes" optionKey="id"
              value="${ARMInstance?.workPlaces}"/>

</div>

