<%@ page import="ru.gbuz.ao.privolgie.app.site.About" %>



<div class="fieldcontain ${hasErrors(bean: aboutInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="about.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: aboutInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: aboutInstance, field: 'content', 'error')} ">
    <label for="content">
        <g:message code="about.content.label" default="Content"/>

    </label>
    <g:textArea name="content" rows="5" cols="40" value="${fieldValue(bean: aboutInstance, field: 'content')}"/>

</div>

