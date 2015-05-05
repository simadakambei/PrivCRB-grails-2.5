<%@ page import="ru.gbuz.ao.privolgie.app.site.News" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="news.edit"/></title>
    <asset:javascript src="ckeditor/ckeditor.js"/>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="news.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="news.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="news.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${newsInstance}">
            <div class="errors">
                <g:renderErrors bean="${newsInstance}" as="list"/>
            </div>
        </g:hasErrors>
        
        <g:form method="post">
            <g:hiddenField name="id" value="${newsInstance?.id}"/>
            <g:hiddenField name="version" value="${newsInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="news.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: newsInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: newsInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="author"><g:message code="news.author"
                                                           default="Author"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: newsInstance, field: 'author', 'errors')}">
                            <g:select name="author.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}"
                                      optionKey="id" value="${newsInstance?.author?.id}" noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateCreated"><g:message code="news.dateCreated"
                                                                default="Date Created"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: newsInstance, field: 'dateCreated', 'errors')}">
                            <g:datePicker locale="ru" format="dd.MM.yyyy" name="dateCreated"
                                          value="${newsInstance?.dateCreated}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td colspan="2" valign="top" class="name">
                            <label for="content"><g:message code="news.content"
                                                            default="Content"/></label>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td colspan="2" valign="top"
                            class="value ${hasErrors(bean: newsInstance, field: 'content', 'errors')}">
                            <g:textArea name="content" id="content" rows="10" cols="80">
                                ${raw(fieldValue(bean: newsInstance, field: 'content'))}
                            </g:textArea>
                            <script>
                                CKEDITOR.replace('content');
                            </script>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="mainPage"><g:message code="news.mainPage"
                                                             default="Main Page"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: newsInstance, field: 'mainPage', 'errors')}">
                            <g:checkBox name="mainPage" value="${newsInstance?.mainPage}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="save" action="update"
                                                     value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
