<%@ page import="ru.gbuz.ao.privolgie.vocs.WorkPlace" %>



<div class="fieldcontain ${hasErrors(bean: workPlaceInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="workPlace.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: workPlaceInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: workPlaceInstance, field: 'definition', 'error')} ">
    <label for="definition">
        <g:message code="workPlace.definition.label" default="Definition"/>

    </label>
    <g:textArea name="definition" rows="5" cols="40"
                value="${fieldValue(bean: workPlaceInstance, field: 'definition')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: workPlaceInstance, field: 'specialist', 'error')} ">
    <label for="specialist">
        <g:message code="workPlace.specialist.label" default="Specialist"/>

    </label>
    <g:select name="specialist.id" from="${ru.gbuz.ao.privolgie.app.entity.Specialist.list()}" optionKey="id"
              value="${workPlaceInstance?.specialist?.id}" noSelection="['null': '']"/>

</div>

