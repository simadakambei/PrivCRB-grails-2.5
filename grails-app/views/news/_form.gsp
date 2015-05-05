<%@ page import="ru.gbuz.ao.privolgie.app.site.News" %>



<div class="fieldcontain ${hasErrors(bean: newsInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="news.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: newsInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsInstance, field: 'author', 'error')} ">
    <label for="author">
        <g:message code="news.author.label" default="Author"/>

    </label>
    <g:select name="author.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}" optionKey="id"
              value="${newsInstance?.author?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsInstance, field: 'content', 'error')} ">
    <label for="content">
        <g:message code="news.content.label" default="Content"/>

    </label>
    <g:textArea name="content" rows="5" cols="40" value="${fieldValue(bean: newsInstance, field: 'content')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: newsInstance, field: 'mainPage', 'error')} ">
    <label for="mainPage">
        <g:message code="news.mainPage.label" default="Main Page"/>

    </label>
    <g:checkBox name="mainPage" value="${newsInstance?.mainPage}"/>

</div>

