<%@ page import="ru.gbuz.ao.privolgie.app.inventory.SystemUnit" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="systemUnit.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="systemUnit.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="systemUnit.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'systemUnit.id', default: 'Id')}"/>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'systemUnit.title', default: 'Title')}"/>

                    <g:sortableColumn property="inventNumber"
                                      title="${message(code: 'systemUnit.inventNumber', default: 'Invent Number')}"/>

                    <g:sortableColumn property="definition"
                                      title="${message(code: 'systemUnit.definition', default: 'Definition')}"/>

                    <th><g:message code="systemUnit.arm"
                                   default="Arm"/></th>

                    <g:sortableColumn property="stickerWindows"
                                      title="${message(code: 'systemUnit.stickerWindows', default: 'Sticker Windows')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${systemUnitInstanceList}" status="i" var="systemUnitInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${systemUnitInstance.id}">${fieldValue(bean: systemUnitInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: systemUnitInstance, field: "title")}</td>

                        <td>${fieldValue(bean: systemUnitInstance, field: "inventNumber")}</td>

                        <td>${fieldValue(bean: systemUnitInstance, field: "definition")}</td>

                        <td>${fieldValue(bean: systemUnitInstance, field: "arm")}</td>

                        <td><g:formatBoolean boolean="${systemUnitInstance.stickerWindows}"/></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${systemUnitInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
