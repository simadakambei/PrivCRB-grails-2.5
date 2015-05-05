<%@ page import="ru.gbuz.ao.privolgie.security.Authority" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="authority.show"/></title>
</head>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="authority.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="authority.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="authority.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>


        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="authority.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: authorityInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="authority.authority"
                                                             default="Authority"/></td>

                    <td valign="top" class="value">${fieldValue(bean: authorityInstance, field: "authority")}</td>

                </tr>
                <tr class="prop">
                    <td valign="top" class="name"><g:message code="authority.description"
                                                             default="Description"/></td>

                    <td valign="top" class="value">${fieldValue(bean: authorityInstance, field: "description")}</td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${authorityInstance?.id}"/>
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </g:form>
        </div>
</div>
</body>
</html>
