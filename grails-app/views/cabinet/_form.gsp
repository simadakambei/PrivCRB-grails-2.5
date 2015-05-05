<%@ page import="ru.gbuz.ao.privolgie.app.entity.Cabinet" %>



<div class="fieldcontain ${hasErrors(bean: cabinetInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="cabinet.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: cabinetInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cabinetInstance, field: 'number', 'error')} ">
    <label for="number">
        <g:message code="cabinet.number.label" default="Number"/>

    </label>
    <g:textField name="number" value="${fieldValue(bean: cabinetInstance, field: 'number')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cabinetInstance, field: 'definition', 'error')} ">
    <label for="definition">
        <g:message code="cabinet.definition.label" default="Definition"/>

    </label>
    <g:textArea name="definition" rows="5" cols="40" value="${fieldValue(bean: cabinetInstance, field: 'definition')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cabinetInstance, field: 'unit', 'error')} ">
    <label for="unit">
        <g:message code="cabinet.unit.label" default="Unit"/>

    </label>
    <g:select name="unit.id" from="${ru.gbuz.ao.privolgie.app.entity.DepartmentUnit.list()}" optionKey="id"
              value="${cabinetInstance?.unit?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: cabinetInstance, field: 'arms', 'error')} ">
    <label for="arms">
        <g:message code="cabinet.arms.label" default="Arms"/>

    </label>
    <g:select name="arms"
              from="${ru.gbuz.ao.privolgie.app.inventory.ARM.list()}"
              size="5" multiple="yes" optionKey="id"
              value="${cabinetInstance?.arms}"/>

</div>

