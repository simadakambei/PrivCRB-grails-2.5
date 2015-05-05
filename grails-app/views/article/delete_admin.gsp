<%@ page import="ru.gbuz.ao.privolgie.app.site.Article" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="article.delete"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="article.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="article.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="article.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${articleInstance}">
            <div class="errors">
                <g:renderErrors bean="${articleInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="article.title"
                                                          default="Title"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: articleInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: articleInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateCreated"><g:message code="article.dateCreated"
                                                                default="Date Created"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: articleInstance, field: 'dateCreated', 'errors')}">
                            <g:datePicker name="dateCreated" value="${articleInstance?.dateCreated}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="author"><g:message code="article.author"
                                                           default="Author"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: articleInstance, field: 'author', 'errors')}">
                            <g:select name="author.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}"
                                      optionKey="id" value="${articleInstance?.author?.id}" noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="content"><g:message code="article.content"
                                                            default="Content"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: articleInstance, field: 'content', 'errors')}">
                            <g:textArea name="content" rows="5" cols="40"
                                        value="${fieldValue(bean: articleInstance, field: 'content')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="mainPage"><g:message code="article.mainPage"
                                                             default="Main Page"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: articleInstance, field: 'mainPage', 'errors')}">
                            <g:checkBox name="mainPage" value="${articleInstance?.mainPage}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="archive"><g:message code="article.archive"
                                                            default="Archive"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: articleInstance, field: 'archive', 'errors')}">
                            <g:checkBox name="archive" value="${articleInstance?.archive}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', 'default': 'Delete')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
