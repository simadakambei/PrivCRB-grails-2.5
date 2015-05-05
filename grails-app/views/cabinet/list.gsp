<%@ page import="ru.gbuz.ao.privolgie.app.entity.Cabinet" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="cabinet.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="cabinet.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="cabinet.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'cabinet.id', default: 'Id')}"/>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'cabinet.title', default: 'Title')}"/>

                    <g:sortableColumn property="number"
                                      title="${message(code: 'cabinet.number', default: 'Number')}"/>

                    <g:sortableColumn property="definition"
                                      title="${message(code: 'cabinet.definition', default: 'Definition')}"/>

                    <th><g:message code="cabinet.unit"
                                   default="Unit"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${cabinetInstanceList}" status="i" var="cabinetInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${cabinetInstance.id}">${fieldValue(bean: cabinetInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: cabinetInstance, field: "title")}</td>

                        <td>${fieldValue(bean: cabinetInstance, field: "number")}</td>

                        <td>${fieldValue(bean: cabinetInstance, field: "definition")}</td>

                        <td>${fieldValue(bean: cabinetInstance, field: "unit")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${cabinetInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
