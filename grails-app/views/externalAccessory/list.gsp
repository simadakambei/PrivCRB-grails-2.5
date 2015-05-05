<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ExternalAccessory" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="externalAccessory.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="externalAccessory.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="externalAccessory.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <th><g:message code="externalAccessory.product"
                                   default="Product"/></th>

                    <th><g:message code="externalAccessory.manufacturer"
                                   default="Manufacturer"/></th>

                    <th><g:message code="externalAccessory.externalAccessoryType"
                                   default="External Accessory Type"/></th>

                    <g:sortableColumn property="inventNumber"
                                      title="${message(code: 'externalAccessory.inventNumber', default: 'Invent Number')}"/>

                    <th><g:message code="externalAccessory.arm"
                                   default="Arm"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${externalAccessoryInstanceList}" status="i" var="externalAccessoryInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${externalAccessoryInstance.id}">${fieldValue(bean: externalAccessoryInstance, field: "product")}</g:link></td>

                        <td>${externalAccessoryInstance?.product?.manufacturer}</td>

                        <td>${fieldValue(bean: externalAccessoryInstance, field: "externalAccessoryType")}</td>

                        <td>${fieldValue(bean: externalAccessoryInstance, field: "inventNumber")}</td>

                        <td>${fieldValue(bean: externalAccessoryInstance, field: "arm")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${externalAccessoryInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
