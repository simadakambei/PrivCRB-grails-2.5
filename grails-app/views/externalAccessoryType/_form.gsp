<%@ page import="ru.gbuz.ao.privolgie.vocs.ExternalAccessoryType" %>



<div class="fieldcontain ${hasErrors(bean: externalAccessoryTypeInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="externalAccessoryType.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: externalAccessoryTypeInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: externalAccessoryTypeInstance, field: 'eng_title', 'error')} ">
    <label for="eng_title">
        <g:message code="externalAccessoryType.eng_title.label" default="Engtitle"/>

    </label>
    <g:textField name="eng_title" value="${fieldValue(bean: externalAccessoryTypeInstance, field: 'eng_title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: externalAccessoryTypeInstance, field: 'definition', 'error')} ">
    <label for="definition">
        <g:message code="externalAccessoryType.definition.label" default="Definition"/>

    </label>
    <g:textArea name="definition" rows="5" cols="40"
                value="${fieldValue(bean: externalAccessoryTypeInstance, field: 'definition')}"/>

</div>

