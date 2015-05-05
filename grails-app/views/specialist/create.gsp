<%@ page import="ru.gbuz.ao.privolgie.app.entity.Specialist" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="specialist.create"/></title>
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
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="specialist.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${specialistInstance}">
            <div class="errors">
                <g:renderErrors bean="${specialistInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name"><g:message code="specialist.name"
                                                         default="Name"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: specialistInstance, field: 'name', 'errors')}">
                            <g:textField name="name" value="${fieldValue(bean: specialistInstance, field: 'name')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="specialist.definition"
                                                               default="Definition"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialistInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: specialistInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="speciality"><g:message code="specialist.specialities"
                                                               default="Specialities"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialistInstance, field: 'specialities', 'errors')}">
                            <g:select name="specialities.id" from="${ru.gbuz.ao.privolgie.vocs.Speciality.list()}"
                                      optionKey="id" value="${specialistInstance?.specialities?.id}"
                                      noSelection="['null': '-выбор специальности-']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="sectionMedicalCare"><g:message code="specialist.sectionMedicalCare"
                                                                       default="Department Unit"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialistInstance, field: 'sectionMedicalCare', 'errors')}">
                            <g:select name="sectionMedicalCare.id"
                                      from="${ru.gbuz.ao.privolgie.vocs.SectionMedicalCare.list()}" optionKey="id"
                                      value="${specialistInstance?.sectionMedicalCare?.id}"
                                      noSelection="['null': '-выбор разделя медпомощи-']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="departmentUnit"><g:message code="specialist.departmentUnit"
                                                                   default="Department Unit"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialistInstance, field: 'departmentUnit', 'errors')}">
                            <g:select name="departmentUnit.id"
                                      from="${ru.gbuz.ao.privolgie.app.entity.DepartmentUnit.list()}" optionKey="id"
                                      value="${specialistInstance?.departmentUnit?.id}"
                                      noSelection="['null': '-выбор отделения-']"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:submitButton name="create" class="save"
                                                     value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
