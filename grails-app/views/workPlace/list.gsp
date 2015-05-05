<%@ page import="ru.gbuz.ao.privolgie.vocs.WorkPlace" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="workPlace.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="workPlace.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="workPlace.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'workPlace.title', default: 'Title')}"/>

                    <g:sortableColumn property="definition"
                                      title="${message(code: 'workPlace.definition', default: 'Definition')}"/>

                    <th><g:message code="workPlace.specialist"
                                   default="Specialist"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${workPlaceInstanceList}" status="i" var="workPlaceInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${workPlaceInstance.id}">${fieldValue(bean: workPlaceInstance, field: "title")}</g:link></td>

                        <td>${fieldValue(bean: workPlaceInstance, field: "definition")}</td>

                        <td>${fieldValue(bean: workPlaceInstance, field: "specialist")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${workPlaceInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
