<%@ page import="ru.gbuz.ao.privolgie.app.site.Article" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="article.create"/></title>
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
                code="article.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="article.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${articleInstance}">
            <div class="errors">
                <g:renderErrors bean="${articleInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="article.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: articleInstance, field: 'title', 'errors')}">
                            <g:textField name="title" size="40"
                                         value="${fieldValue(bean: articleInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="author"><g:message code="article.author"
                                                           default="Author"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: articleInstance, field: 'author', 'errors')}">
                            <g:select name="author.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}"
                                      optionKey="id" value="${articleInstance?.author?.id}" noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateCreated"><g:message code="article.dateCreated"
                                                                default="Date Created"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: articleInstance, field: 'dateCreated', 'errors')}">
                            <g:datePicker locale="ru" format="dd.MM.yyyy" name="dateCreated"
                                          value="${articleInstance?.dateCreated}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td colspan="2" valign="top" class="name">
                            <label for="content"><g:message code="article.content"
                                                            default="Content"/></label>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td colspan="2" valign="top"
                            class="value ${hasErrors(bean: articleInstance, field: 'content', 'errors')}">
                            <g:textArea name="content" id="content" rows="10" cols="80">
                                ${raw(fieldValue(bean: articleInstance, field: 'content'))}
                            </g:textArea>
                            <script>
                                CKEDITOR.replace('content');
                            </script>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="mainPage"><g:message code="article.mainPage"
                                                             default="Main Page"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: articleInstance, field: 'mainPage', 'errors')}">
                            <g:checkBox name="mainPage" value="${articleInstance?.mainPage}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="medical"><g:message code="article.medical"
                                                            default="Medical"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: articleInstance, field: 'medical', 'errors')}">
                            <g:checkBox name="medical" value="${articleInstance?.medical}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="archive"><g:message code="article.archive"
                                                            default="Archive"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: articleInstance, field: 'archive', 'errors')}">
                            <g:checkBox name="archive" value="${articleInstance?.archive}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:submitButton name="create" class="save"
                                                     value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
