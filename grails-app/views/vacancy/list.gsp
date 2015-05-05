<%@ page import="ru.gbuz.ao.privolgie.app.site.Vacancy" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="vacancy.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="vacancy.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="vacancy.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'vacancy.id', default: 'Id')}"/>

                    <th><g:message code="vacancy.specialist"
                                   default="Specialist"/></th>

                    <th><g:message code="vacancy.speciality"
                                   default="Speciality"/></th>

                    <th><g:message code="vacancy.department"
                                   default="Department"/></th>

                    <th><g:message code="vacancy.departmentUnit"
                                   default="Department Unit"/></th>

                    <g:sortableColumn property="wageRate"
                                      title="${message(code: 'vacancy.wageRate', default: 'Wage Rate')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${vacancyInstanceList}" status="i" var="vacancyInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${vacancyInstance.id}">${fieldValue(bean: vacancyInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: vacancyInstance, field: "specialist")}</td>

                        <td>${fieldValue(bean: vacancyInstance, field: "speciality")}</td>

                        <td>${fieldValue(bean: vacancyInstance, field: "department")}</td>

                        <td>${fieldValue(bean: vacancyInstance, field: "departmentUnit")}</td>

                        <td>${fieldValue(bean: vacancyInstance, field: "wageRate")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${vacancyInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
