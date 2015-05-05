<%@ page import="ru.gbuz.ao.privolgie.app.entity.Specialist" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'specialist.label', default: 'Specialist')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-specialist" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-specialist" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
     
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="name" title="${message(code: 'specialist.name.label', default: 'Name')}"/>

            <g:sortableColumn property="definition"
                              title="${message(code: 'specialist.definition.label', default: 'Definition')}"/>

            <th><g:message code="specialist.departmentUnit.label" default="Department Unit"/></th>

            <th><g:message code="specialist.sectionMedicalCare.label" default="Section Medical Care"/></th>

            <th><g:message code="specialist.specialities.label" default="Specialities"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${specialistInstanceList}" status="i" var="specialistInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${specialistInstance.id}">${fieldValue(bean: specialistInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: specialistInstance, field: "definition")}</td>

                <td>${fieldValue(bean: specialistInstance, field: "departmentUnit")}</td>

                <td>${fieldValue(bean: specialistInstance, field: "sectionMedicalCare")}</td>

                <td>${fieldValue(bean: specialistInstance, field: "specialities")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${specialistInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
