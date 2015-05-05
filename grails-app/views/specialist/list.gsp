<%@ page import="ru.gbuz.ao.privolgie.app.entity.Specialist" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="specialist.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="specialist.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="specialist.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'specialist.id', default: 'Id')}"/>

                    <g:sortableColumn property="name"
                                      title="${message(code: 'specialist.name', default: 'Name')}"/>

                    <g:sortableColumn property="definition"
                                      title="${message(code: 'specialist.definition', default: 'Definition')}"/>

                    <th><g:message code="specialist.departmentUnit"
                                   default="Department Unit"/></th>

                    <th><g:message code="specialist.sectionMedicalCare"
                                   default="Section Medical Care"/></th>

                    <th><g:message code="specialist.specialities"
                                   default="Specialities"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${specialistInstanceList}" status="i" var="specialistInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${specialistInstance.id}">${fieldValue(bean: specialistInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: specialistInstance, field: "name")}</td>

                        <td>${fieldValue(bean: specialistInstance, field: "definition")}</td>

                        <td>${fieldValue(bean: specialistInstance, field: "departmentUnit")}</td>

                        <td>${fieldValue(bean: specialistInstance, field: "sectionMedicalCare")}</td>

                        <td>${fieldValue(bean: specialistInstance, field: "specialities")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${specialistInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
