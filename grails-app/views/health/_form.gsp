<%@ page import="ru.gbuz.ao.privolgie.app.site.Health" %>



<div class="fieldcontain ${hasErrors(bean: healthInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="health.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: healthInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: healthInstance, field: 'author', 'error')} ">
    <label for="author">
        <g:message code="health.author.label" default="Author"/>

    </label>
    <g:select name="author.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}" optionKey="id"
              value="${healthInstance?.author?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: healthInstance, field: 'content', 'error')} ">
    <label for="content">
        <g:message code="health.content.label" default="Content"/>

    </label>
    <g:textArea name="content" rows="5" cols="40" value="${fieldValue(bean: healthInstance, field: 'content')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: healthInstance, field: 'archive', 'error')} ">
    <label for="archive">
        <g:message code="health.archive.label" default="Archive"/>

    </label>
    <g:checkBox name="archive" value="${healthInstance?.archive}"/>

</div>

