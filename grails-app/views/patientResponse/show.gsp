<%@ page import="ru.gbuz.ao.privolgie.app.site.PatientResponse" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="patientResponse.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="patientResponse.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="patientResponse.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="patientResponse.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="patientResponse.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: patientResponseInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="patientResponse.patientFIO"
                                                             default="Patient FIO"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: patientResponseInstance, field: "patientFIO")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="patientResponse.addres"
                                                             default="Addres"/></td>

                    <td valign="top" class="value">${fieldValue(bean: patientResponseInstance, field: "addres")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="patientResponse.dateResponse"
                                                             default="Date Response"/></td>

                    <td valign="top" class="value"><g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                                                                 date="${patientResponseInstance.dateResponse}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="patientResponse.response"
                                                             default="Response"/></td>

                    <td valign="top" class="value">${fieldValue(bean: patientResponseInstance, field: "response")}</td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${patientResponseInstance?.id}"/>
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
