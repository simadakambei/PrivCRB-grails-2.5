<%@ page import="ru.gbuz.ao.privolgie.app.site.Vacancy" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="vacancy.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="vacancy.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="vacancy.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="vacancy.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${vacancyInstance}">
            <div class="errors">
                <g:renderErrors bean="${vacancyInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form method="post">
            <g:hiddenField name="id" value="${vacancyInstance?.id}"/>
            <g:hiddenField name="version" value="${vacancyInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="specialist"><g:message code="vacancy.specialist"
                                                               default="Specialist"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: vacancyInstance, field: 'specialist', 'errors')}">
                            <g:select name="specialist.id" from="${ru.gbuz.ao.privolgie.app.entity.Specialist.list()}"
                                      optionKey="id" value="${vacancyInstance?.specialist?.id}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="speciality"><g:message code="vacancy.speciality"
                                                               default="Speciality"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: vacancyInstance, field: 'speciality', 'errors')}">
                            <g:select name="speciality.id" from="${ru.gbuz.ao.privolgie.vocs.Speciality.list()}"
                                      optionKey="id" value="${vacancyInstance?.speciality?.id}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="department"><g:message code="vacancy.department"
                                                               default="Department"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: vacancyInstance, field: 'department', 'errors')}">
                            <g:select name="department.id" from="${ru.gbuz.ao.privolgie.app.entity.Department.list()}"
                                      optionKey="id" value="${vacancyInstance?.department?.id}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="departmentUnit"><g:message code="vacancy.departmentUnit"
                                                                   default="Department Unit"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: vacancyInstance, field: 'departmentUnit', 'errors')}">
                            <g:select name="departmentUnit.id"
                                      from="${ru.gbuz.ao.privolgie.app.entity.DepartmentUnit.list()}" optionKey="id"
                                      value="${vacancyInstance?.departmentUnit?.id}" noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="wageRate"><g:message code="vacancy.wageRate"
                                                             default="Wage Rate"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: vacancyInstance, field: 'wageRate', 'errors')}">
                            <g:textField name="wageRate"
                                         value="${fieldValue(bean: vacancyInstance, field: 'wageRate')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="salary"><g:message code="vacancy.salary"
                                                           default="Salary"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: vacancyInstance, field: 'salary', 'errors')}">
                            <g:textField name="salary" value="${fieldValue(bean: vacancyInstance, field: 'salary')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="salatymin"><g:message code="vacancy.salatymin"
                                                              default="Salatymin"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: vacancyInstance, field: 'salatymin', 'errors')}">
                            <g:textField name="salatymin"
                                         value="${fieldValue(bean: vacancyInstance, field: 'salatymin')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="salarymax"><g:message code="vacancy.salarymax"
                                                              default="Salarymax"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: vacancyInstance, field: 'salarymax', 'errors')}">
                            <g:textField name="salarymax"
                                         value="${fieldValue(bean: vacancyInstance, field: 'salarymax')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="housing"><g:message code="vacancy.housing"
                                                            default="Housing"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: vacancyInstance, field: 'housing', 'errors')}">
                            <g:checkBox name="housing" value="${vacancyInstance?.housing}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="vacancy.definition"
                                                               default="Definition"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: vacancyInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: vacancyInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="save" action="update"
                                                     value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
