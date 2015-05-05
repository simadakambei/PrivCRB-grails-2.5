<%@ page import="ru.gbuz.ao.privolgie.vocs.ComputerAccessoryType" %>



<div class="fieldcontain ${hasErrors(bean: computerAccessoryTypeInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="computerAccessoryType.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: computerAccessoryTypeInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: computerAccessoryTypeInstance, field: 'eng_title', 'error')} ">
    <label for="eng_title">
        <g:message code="computerAccessoryType.eng_title.label" default="Engtitle"/>

    </label>
    <g:textField name="eng_title" value="${fieldValue(bean: computerAccessoryTypeInstance, field: 'eng_title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: computerAccessoryTypeInstance, field: 'definition', 'error')} ">
    <label for="definition">
        <g:message code="computerAccessoryType.definition.label" default="Definition"/>

    </label>
    <g:textArea name="definition" rows="5" cols="40"
                value="${fieldValue(bean: computerAccessoryTypeInstance, field: 'definition')}"/>

</div>

