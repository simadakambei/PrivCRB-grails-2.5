<%@ page import="ru.gbuz.ao.privolgie.vocs.Link" %>



<div class="fieldcontain ${hasErrors(bean: linkInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="link.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" value="${fieldValue(bean: linkInstance, field: 'name')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkInstance, field: 'url', 'error')} required">
    <label for="url">
        <g:message code="link.url.label" default="Url"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="url" value="${fieldValue(bean: linkInstance, field: 'url')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkInstance, field: 'definition', 'error')} ">
    <label for="definition">
        <g:message code="link.definition.label" default="Definition"/>

    </label>
    <g:textArea name="definition" rows="5" cols="40" value="${fieldValue(bean: linkInstance, field: 'definition')}"/>

</div>

