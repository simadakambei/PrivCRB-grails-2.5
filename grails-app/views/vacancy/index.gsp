<%@ page import="ru.gbuz.ao.privolgie.app.site.Vacancy" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'vacancy.label', default: 'Vacancy')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-vacancy" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-vacancy" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="vacancy.specialist.label" default="Specialist"/></th>

            <th><g:message code="vacancy.speciality.label" default="Speciality"/></th>

            <th><g:message code="vacancy.department.label" default="Department"/></th>

            <th><g:message code="vacancy.departmentUnit.label" default="Department Unit"/></th>

            <g:sortableColumn property="wageRate"
                              title="${message(code: 'vacancy.wageRate.label', default: 'Wage Rate')}"/>

            <g:sortableColumn property="salary" title="${message(code: 'vacancy.salary.label', default: 'Salary')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${vacancyInstanceList}" status="i" var="vacancyInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${vacancyInstance.id}">${fieldValue(bean: vacancyInstance, field: "specialist")}</g:link></td>

                <td>${fieldValue(bean: vacancyInstance, field: "speciality")}</td>

                <td>${fieldValue(bean: vacancyInstance, field: "department")}</td>

                <td>${fieldValue(bean: vacancyInstance, field: "departmentUnit")}</td>

                <td>${fieldValue(bean: vacancyInstance, field: "wageRate")}</td>

                <td>${fieldValue(bean: vacancyInstance, field: "salary")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${vacancyInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
