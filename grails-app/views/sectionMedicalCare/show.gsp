<%@ page import="ru.gbuz.ao.privolgie.vocs.SectionMedicalCare" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="sectionMedicalCare.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="sectionMedicalCare.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="sectionMedicalCare.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="sectionMedicalCare.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="sectionMedicalCare.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: sectionMedicalCareInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="sectionMedicalCare.name"
                                                             default="Name"/></td>

                    <td valign="top" class="value">${fieldValue(bean: sectionMedicalCareInstance, field: "name")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="sectionMedicalCare.specialists"
                                                             default="Specialists"/></td>

                    <td valign="top" class="value"><g:link controller="specialist"
                                                           action="show"
                                                           id="${sectionMedicalCareInstance?.specialists?.id}">${sectionMedicalCareInstance?.specialists?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td colspan="2" valign="top" class="name"><g:message code="sectionMedicalCare.medicalServizes"
                                                             default="Medical Servizes"/></td>
                </tr>
                <tr class="prop">
                    <td colspan="2" valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${sectionMedicalCareInstance.medicalServizes}" var="m">
                                <li><g:link controller="medicalServize" action="show"
                                            id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${sectionMedicalCareInstance?.id}"/>
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