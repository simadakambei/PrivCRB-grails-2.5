<%@ page import="ru.gbuz.ao.privolgie.app.site.Health" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="health.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="health.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message code="health.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="health.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="health.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: healthInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="health.title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: healthInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="health.dateCreated"
                                                             default="Date Created"/></td>

                    <td valign="top" class="value"><g:formatDate date="${healthInstance?.dateCreated}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="health.author"
                                                             default="Author"/></td>

                    <td valign="top" class="value"><g:link controller="person"
                                                           action="show"
                                                           id="${healthInstance?.author?.id}">${healthInstance?.author?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="health.content"
                                                             default="Content"/></td>

                    <td valign="top" class="value">${raw(healthInstance?.content)}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="health.archive"
                                                             default="Archive"/></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${healthInstance?.archive}"/></td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${healthInstance?.id}"/>
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
