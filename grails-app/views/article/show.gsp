<%@ page import="ru.gbuz.ao.privolgie.app.site.Article" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="article.show"/> - ${articleInstance?.title} : <g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                                                                                        date="${articleInstance.dateCreated}"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="article.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message code="article.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="article.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="article.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: articleInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="article.title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: articleInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="article.dateCreated"
                                                             default="Date Created"/></td>

                    <td valign="top" class="value"><g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                                                                 date="${articleInstance.dateCreated}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="article.author"
                                                             default="Author"/></td>

                    <td valign="top" class="value"><g:link controller="person"
                                                           action="show"
                                                           id="${articleInstance?.author?.id}">${articleInstance?.author?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td colspan="2" valign="top" class="name"><g:message code="article.content"
                                                             default="Content"/></td>
                </tr>
                <tr class="prop">
                    <td colspan="2" valign="top"
                        class="value">${raw(articleInstance?.content)}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="article.mainPage"
                                                             default="Main Page"/></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${articleInstance?.mainPage}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="article.medical"
                                                             default="Medical"/></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${articleInstance?.medical}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="article.archive"
                                                             default="Archive"/></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${articleInstance?.archive}"/></td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${articleInstance?.id}"/>
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </g:form>
        </div>
    </fieldset>
</div>
</body>
</html>
