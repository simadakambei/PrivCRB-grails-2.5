<%@ page import="ru.gbuz.ao.privolgie.app.site.Article" %>



<div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="article.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: articleInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'author', 'error')} ">
    <label for="author">
        <g:message code="article.author.label" default="Author"/>

    </label>
    <g:select name="author.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}" optionKey="id"
              value="${articleInstance?.author?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'content', 'error')} ">
    <label for="content">
        <g:message code="article.content.label" default="Content"/>

    </label>
    <g:textArea name="content" rows="5" cols="40" value="${fieldValue(bean: articleInstance, field: 'content')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'mainPage', 'error')} ">
    <label for="mainPage">
        <g:message code="article.mainPage.label" default="Main Page"/>

    </label>
    <g:checkBox name="mainPage" value="${articleInstance?.mainPage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: articleInstance, field: 'archive', 'error')} ">
    <label for="archive">
        <g:message code="article.archive.label" default="Archive"/>

    </label>
    <g:checkBox name="archive" value="${articleInstance?.archive}"/>

</div>

