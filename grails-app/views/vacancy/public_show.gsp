<%@ page import="ru.gbuz.ao.privolgie.app.site.Vacancy" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="vacancy.show"/>: ${vacancyInstance?.specialist}</title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.specialist"
                                                             default="Specialist"/></td>

                    <td valign="top" class="value">${vacancyInstance?.specialist?.encodeAsHTML()}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.specialities"
                                                             default="Speciality"/></td>

                    <td valign="top" class="value">${vacancyInstance?.speciality?.encodeAsHTML()}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.department"
                                                             default="Department"/></td>

                    <td valign="top" class="value"><g:link controller="department"
                                                           action="public_show"
                                                           id="${vacancyInstance?.department?.id}">${vacancyInstance?.department?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.departmentUnit"
                                                             default="Department Unit"/></td>

                    <td valign="top" class="value"><g:link controller="departmentUnit"
                                                           action="public_show"
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

                    <td valign="top" class="value">${fieldValue(bean: vacancyInstance, field: "salary")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.salatymin"
                                                             default="Salatymin"/></td>

                    <td valign="top" class="value">${fieldValue(bean: vacancyInstance, field: "salatymin")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="vacancy.salarymax"
                                                             default="Salarymax"/></td>

                    <td valign="top" class="value">${fieldValue(bean: vacancyInstance, field: "salarymax")}</td>

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
    </fieldset>
</div>
</body>
</html>
