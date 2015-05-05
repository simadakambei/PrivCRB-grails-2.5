<%@ page import="ru.gbuz.ao.privolgie.app.site.Vacancy" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="vacancy.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="vacancy.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message code="vacancy.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="vacancy.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: vacancyInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.specialist"
                                                             default="Specialist"/></td>

                    <td valign="top" class="value"><g:link controller="specialist"
                                                           action="show"
                                                           id="${vacancyInstance?.specialist?.id}">${vacancyInstance?.specialist?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.specialities"
                                                             default="Speciality"/></td>

                    <td valign="top" class="value"><g:link controller="speciality"
                                                           action="show"
                                                           id="${vacancyInstance?.speciality?.id}">${vacancyInstance?.speciality?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.department"
                                                             default="Department"/></td>

                    <td valign="top" class="value"><g:link controller="department"
                                                           action="show"
                                                           id="${vacancyInstance?.department?.id}">${vacancyInstance?.department?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.departmentUnit"
                                                             default="Department Unit"/></td>

                    <td valign="top" class="value"><g:link controller="departmentUnit"
                                                           action="show"
                                                           id="${vacancyInstance?.departmentUnit?.id}">${vacancyInstance?.departmentUnit?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.wageRate"
                                                             default="Wage Rate"/></td>

                    <td valign="top" class="value">${fieldValue(bean: vacancyInstance, field: "wageRate")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.salary"
                                                             default="Salary"/></td>

                    <td valign="top" class="value">${fieldValue(bean: vacancyInstance, field: "salary")} руб.</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.salatymin"
                                                             default="Salatymin"/></td>

                    <td valign="top" class="value">от ${fieldValue(bean: vacancyInstance, field: "salatymin")} руб.</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.salarymax"
                                                             default="Salarymax"/></td>

                    <td valign="top" class="value">до ${fieldValue(bean: vacancyInstance, field: "salarymax")} руб.</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.housing"
                                                             default="Housing"/></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${vacancyInstance?.housing}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.definition"
                                                             default="Definition"/></td>

                    <td valign="top" class="value">${fieldValue(bean: vacancyInstance, field: "definition")}</td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${vacancyInstance?.id}"/>
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
