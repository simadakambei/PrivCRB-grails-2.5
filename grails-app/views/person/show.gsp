
<%@ page import="ru.gbuz.ao.privolgie.security.Person" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="person.show"/></title>
</head>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="person.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="person.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="person.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: personInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.username"
                                                             default="User Name"/></td>

                    <td valign="top" class="value">${fieldValue(bean: personInstance, field: "username")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.userRealName"
                                                             default="Full Name"/></td>

                    <td valign="top" class="value">${fieldValue(bean: personInstance, field: "fullname")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.password"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: personInstance, field: "password")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.accountExpired"
                                                             default="Account Expired"/></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.accountExpired}" /></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.accountLocked"
                                                             default="Account Locked"/></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.accountLocked}" /></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.enabled"
                                                             default="Enabled"/></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.enabled}" /></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="person.passwordExpired"
                                                             default="Password Expired"/></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${personInstance?.passwordExpired}" /></td>

                </tr>



                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${personInstance?.id}"/>
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

