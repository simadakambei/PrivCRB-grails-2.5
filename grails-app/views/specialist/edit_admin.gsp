<%@ page import="ru.gbuz.ao.privolgie.app.entity.Specialist" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="specialist.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="specialist.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="specialist.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="specialist.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${specialistInstance}">
            <div class="errors">
                <g:renderErrors bean="${specialistInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name"><g:message code="specialist.name"
                                                         default="Name"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialistInstance, field: 'name', 'errors')}">
                            <g:textField name="name" value="${fieldValue(bean: specialistInstance, field: 'name')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="specialist.definition"
                                                               default="Definition"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialistInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: specialistInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="departmentUnit"><g:message code="specialist.departmentUnit"
                                                                   default="Department Unit"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialistInstance, field: 'departmentUnit', 'errors')}">
                            <g:select name="departmentUnit.id"
                                      from="${ru.gbuz.ao.privolgie.app.entity.DepartmentUnit.list()}" optionKey="id"
                                      value="${specialistInstance?.departmentUnit?.id}" noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="sectionMedicalCare"><g:message code="specialist.sectionMedicalCare"
                                                                       default="Section Medical Care"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialistInstance, field: 'sectionMedicalCare', 'errors')}">
                            <g:select name="sectionMedicalCare.id"
                                      from="${ru.gbuz.ao.privolgie.vocs.SectionMedicalCare.list()}" optionKey="id"
                                      value="${specialistInstance?.sectionMedicalCare?.id}" noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="specialities"><g:message code="specialist.specialities"
                                                                 default="Specialities"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialistInstance, field: 'specialities', 'errors')}">
                            <g:select name="specialities.id" from="${ru.gbuz.ao.privolgie.vocs.Speciality.list()}"
                                      optionKey="id" value="${specialistInstance?.specialities?.id}"
                                      noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="medicalServizes"><g:message code="specialist.medicalServizes"
                                                                    default="Medical Servizes"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialistInstance, field: 'medicalServizes', 'errors')}">

                            <ul>
                                <g:each in="${specialistInstance?.medicalServizes}" var="medicalServizeInstance">
                                    <li><g:link controller="medicalServize" action="show"
                                                id="${medicalServizeInstance.id}">${medicalServizeInstance?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller="medicalServize" params="['specialist.id': specialistInstance?.id]"
                                    action="create"><g:message code="medicalServize.new"
                                                               default="New MedicalServize"/></g:link>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="people"><g:message code="specialist.people"
                                                           default="People"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialistInstance, field: 'people', 'errors')}">

                            <ul>
                                <g:each in="${specialistInstance?.people}" var="personInstance">
                                    <li><g:link controller="person" action="show"
                                                id="${personInstance.id}">${personInstance?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller="person" params="['specialist.id': specialistInstance?.id]"
                                    action="create"><g:message code="person.new" default="New Person"/></g:link>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="workplaces"><g:message code="specialist.workplaces"
                                                               default="Workplaces"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialistInstance, field: 'workplaces', 'errors')}">

                            <ul>
                                <g:each in="${specialistInstance?.workplaces}" var="workPlaceInstance">
                                    <li><g:link controller="workPlace" action="show"
                                                id="${workPlaceInstance.id}">${workPlaceInstance?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller="workPlace" params="['specialist.id': specialistInstance?.id]"
                                    action="create"><g:message code="workPlace.new" default="New WorkPlace"/></g:link>

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
