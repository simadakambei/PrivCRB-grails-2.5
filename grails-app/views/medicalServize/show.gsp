<%@ page import="ru.gbuz.ao.privolgie.vocs.MedicalServize" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="medicalServize.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumedicalservize"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="medicalServize.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="medicalServize.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="medicalServize.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="medicalServize.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: medicalServizeInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="medicalServize.code"
                                                             default="Code"/></td>

                    <td valign="top" class="value">${fieldValue(bean: medicalServizeInstance, field: "code")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="medicalServize.name"
                                                             default="Name"/></td>

                    <td valign="top" class="value">${fieldValue(bean: medicalServizeInstance, field: "name")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="medicalServize.cost"
                                                             default="Cost"/></td>

                    <td valign="top" class="value">${fieldValue(bean: medicalServizeInstance, field: "cost")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="medicalServize.sectionMedicalCare"
                                                             default="Section Medical Care"/></td>

                    <td valign="top" class="value"><g:link controller="sectionMedicalCare"
                                                           action="show"
                                                           id="${medicalServizeInstance?.sectionMedicalCare?.id}">${medicalServizeInstance?.sectionMedicalCare?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="medicalServize.specialist"
                                                             default="Specialist"/></td>

                    <td valign="top" class="value"><g:link controller="specialist"
                                                           action="show"
                                                           id="${medicalServizeInstance?.specialist?.id}">${medicalServizeInstance?.specialist?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="medicalServize.definition"
                                                             default="Definition"/></td>

                    <td valign="top" class="value">${fieldValue(bean: medicalServizeInstance, field: "definition")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="medicalServize.actuality"
                                                             default="Actuality"/></td>

                    <td valign="top" class="value"><g:formatBoolean
                            boolean="${medicalServizeInstance?.actuality}"/></td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${medicalServizeInstance?.id}"/>
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
