<%@ page import="ru.gbuz.ao.privolgie.app.site.Sanprosvet" %>



<div class="fieldcontain ${hasErrors(bean: sanprosvetInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="sanprosvet.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: sanprosvetInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sanprosvetInstance, field: 'author', 'error')} ">
    <label for="author">
        <g:message code="sanprosvet.author.label" default="Author"/>

    </label>
    <g:select name="author.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}" optionKey="id"
              value="${sanprosvetInstance?.author?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sanprosvetInstance, field: 'content', 'error')} ">
    <label for="content">
        <g:message code="sanprosvet.content.label" default="Content"/>

    </label>
    <g:textArea name="content" rows="5" cols="40" value="${fieldValue(bean: sanprosvetInstance, field: 'content')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sanprosvetInstance, field: 'archive', 'error')} ">
    <label for="archive">
        <g:message code="sanprosvet.archive.label" default="Archive"/>

    </label>
    <g:checkBox name="archive" value="${sanprosvetInstance?.archive}"/>

</div>

