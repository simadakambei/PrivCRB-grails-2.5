<%@ page import="ru.gbuz.ao.privolgie.vocs.ServicePopulation" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="servicePopulation.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="servicePopulation.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="servicePopulation.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'servicePopulation.id', default: 'Id')}"/>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'servicePopulation.title', default: 'Title')}"/>

                    <g:sortableColumn property="description"
                                      title="${message(code: 'servicePopulation.description', default: 'Description')}"/>

                    <g:sortableColumn property="medcode"
                                      title="${message(code: 'servicePopulation.medcode', default: 'Medcode')}"/>

                    <g:sortableColumn property="working"
                                      title="${message(code: 'servicePopulation.working', default: 'Working')}"/>

                    <g:sortableColumn property="onsite"
                                      title="${message(code: 'servicePopulation.onsite', default: 'Onsite')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${servicePopulationInstanceList}" status="i" var="servicePopulationInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${servicePopulationInstance.id}">${fieldValue(bean: servicePopulationInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: servicePopulationInstance, field: "title")}</td>

                        <td>${fieldValue(bean: servicePopulationInstance, field: "description")}</td>

                        <td>${fieldValue(bean: servicePopulationInstance, field: "medcode")}</td>

                        <td><g:formatBoolean boolean="${servicePopulationInstance.working}"/></td>

                        <td><g:formatBoolean boolean="${servicePopulationInstance.onsite}"/></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${servicePopulationInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
