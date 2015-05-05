<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ComputerAccessory" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="computerAccessory.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="computerAccessory.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="computerAccessory.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'computerAccessory.id', default: 'Id')}"/>

                    <th><g:message code="computerAccessory.product"
                                   default="Product"/></th>

                    <th><g:message code="computerAccessory.manufacturer"
                                   default="Manufacturer"/></th>

                    <th><g:message code="computerAccessory.computerAccessoryType"
                                   default="Computer Accessory Type"/></th>

                    <th><g:message code="computerAccessory.systemUnit"
                                   default="System Unit"/></th>

                    <g:sortableColumn property="specification"
                                      title="${message(code: 'computerAccessory.specification', default: 'Specification')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${computerAccessoryInstanceList}" status="i" var="computerAccessoryInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${computerAccessoryInstance.id}">${fieldValue(bean: computerAccessoryInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: computerAccessoryInstance, field: "product")}</td>

                        <td>${fieldValue(bean: computerAccessoryInstance, field: "manufacturer")}</td>

                        <td>${fieldValue(bean: computerAccessoryInstance, field: "computerAccessoryType")}</td>

                        <td>${fieldValue(bean: computerAccessoryInstance, field: "systemUnit")}</td>

                        <td>${fieldValue(bean: computerAccessoryInstance, field: "specification")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${computerAccessoryInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
