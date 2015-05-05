<%@ page import="ru.gbuz.ao.privolgie.vocs.SectionMedicalCare" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="sectionMedicalCare.edit"/></title>
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
                code="sectionMedicalCare.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="sectionMedicalCare.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${sectionMedicalCareInstance}">
            <div class="errors">
                <g:renderErrors bean="${sectionMedicalCareInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name"><g:message code="sectionMedicalCare.name"
                                                         default="Name"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: sectionMedicalCareInstance, field: 'name', 'errors')}">
                            <g:textField name="name"
                                         value="${fieldValue(bean: sectionMedicalCareInstance, field: 'name')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="specialists"><g:message code="sectionMedicalCare.specialists"
                                                                default="Specialists"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: sectionMedicalCareInstance, field: 'specialists', 'errors')}">
                            <g:select name="specialists.id" from="${ru.gbuz.ao.privolgie.app.entity.Specialist.list()}"
                                      optionKey="id" value="${sectionMedicalCareInstance?.specialists?.id}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="medicalServizes"><g:message code="sectionMedicalCare.medicalServizes"
                                                                    default="Medical Servizes"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: sectionMedicalCareInstance, field: 'medicalServizes', 'errors')}">

                            <ul>
                                <g:each in="${sectionMedicalCareInstance?.medicalServizes}"
                                        var="medicalServizeInstance">
                                    <li><g:link controller="medicalServize" action="show"
                                                id="${medicalServizeInstance.id}">${medicalServizeInstance?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller="medicalServize"
                                    params="['sectionMedicalCare.id': sectionMedicalCareInstance?.id]"
                                    action="create"><g:message code="medicalServize.new"
                                                               default="New MedicalServize"/></g:link>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', 'default': 'Edit')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
