<%@ page import="ru.gbuz.ao.privolgie.app.site.RequestAnAppeal" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="requestAnAppeal.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="requestAnAppeal.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="requestAnAppeal.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="requestAnAppeal.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="requestAnAppeal.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: requestAnAppealInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="requestAnAppeal.requestFIO"
                                                             default="Request FIO"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: requestAnAppealInstance, field: "requestFIO")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="requestAnAppeal.requestAddres"
                                                             default="Request Addres"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: requestAnAppealInstance, field: "requestAddres")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="requestAnAppeal.phone"
                                                             default="Phone"/></td>

                    <td valign="top" class="value">${fieldValue(bean: requestAnAppealInstance, field: "phone")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="requestAnAppeal.email"
                                                             default="Email"/></td>

                    <td valign="top" class="value">${fieldValue(bean: requestAnAppealInstance, field: "email")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="requestAnAppeal.requestDate"
                                                             default="Request Date"/></td>

                    <td valign="top" class="value"><g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                                                                 date="${requestAnAppealInstance?.requestDate}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="requestAnAppeal.officialPost"
                                                             default="Official Post"/></td>

                    <td valign="top" class="value"><g:link controller="officialPost"
                                                           action="show"
                                                           id="${requestAnAppealInstance?.officialPost?.id}">${requestAnAppealInstance?.officialPost?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="requestAnAppeal.requestAnAppeal"
                                                             default="Request An Appeal"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: requestAnAppealInstance, field: "requestAnAppeal")}</td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${requestAnAppealInstance?.id}"/>
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
