<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ComputerAccessory" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="computerAccessory.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="computerAccessory.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="computerAccessory.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="computerAccessory.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: computerAccessoryInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="computerAccessory.product"
                                                             default="Product"/></td>

                    <td valign="top" class="value"><g:link controller="product"
                                                           action="show"
                                                           id="${computerAccessoryInstance?.product?.id}">${computerAccessoryInstance?.product?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="computerAccessory.manufacturer"
                                                             default="Manufacturer"/></td>

                    <td valign="top" class="value"><g:link controller="manufacturer"
                                                           action="show"
                                                           id="${computerAccessoryInstance?.manufacturer?.id}">${computerAccessoryInstance?.manufacturer?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="computerAccessory.computerAccessoryType"
                                                             default="Computer Accessory Type"/></td>

                    <td valign="top" class="value"><g:link controller="computerAccessoryType"
                                                           action="show"
                                                           id="${computerAccessoryInstance?.computerAccessoryType?.id}">${computerAccessoryInstance?.computerAccessoryType?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="computerAccessory.systemUnit"
                                                             default="System Unit"/></td>

                    <td valign="top" class="value"><g:link controller="systemUnit"
                                                           action="show"
                                                           id="${computerAccessoryInstance?.systemUnit?.id}">${computerAccessoryInstance?.systemUnit?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="computerAccessory.specification"
                                                             default="Specification"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: computerAccessoryInstance, field: "specification")}</td>

                </tr>

                </tbody>
            </table>
        </div>
    </fieldset>
</div>
</body>
</html>
