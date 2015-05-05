<%@ page import="ru.gbuz.ao.privolgie.app.site.About" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="about.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="about.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message code="about.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="about.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="about.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: aboutInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="about.title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: aboutInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="about.visible"
                                                             default="Visiblee"/></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${aboutInstance.visible}"
                                                                    true="${message(code: 'about.visible')}"
                                                                    false="${message(code: 'default.boolean.false')}"/></td>

                </tr>

                <tr class="prop">
                    <td colspan="2" valign="top" class="name"><g:message code="about.content"
                                                                         default="Content"/></td>
                </tr>
                <tr class="prop">
                    <td colspan="2" valign="top"
                        class="value">${raw(aboutInstance?.content)}</td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${aboutInstance?.id}"/>
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
