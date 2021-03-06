<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ExternalAccessory" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="externalAccessory.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="externalAccessory.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="externalAccessory.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="externalAccessory.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: externalAccessoryInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="externalAccessory.product"
                                                             default="Product"/></td>

                    <td valign="top" class="value"><g:link controller="product"
                                                           action="show"
                                                           id="${externalAccessoryInstance?.product?.id}">${externalAccessoryInstance?.product?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="externalAccessory.externalAccessoryType"
                                                             default="External Accessory Type"/></td>

                    <td valign="top" class="value"><g:link controller="externalAccessoryType"
                                                           action="show"
                                                           id="${externalAccessoryInstance?.externalAccessoryType?.id}">${externalAccessoryInstance?.externalAccessoryType?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="externalAccessory.inventNumber"
                                                             default="Invent Number"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: externalAccessoryInstance, field: "inventNumber")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="externalAccessory.arm"
                                                             default="Arm"/></td>

                    <td valign="top" class="value"><g:link controller="ARM"
                                                           action="show"
                                                           id="${externalAccessoryInstance?.arm?.id}">${externalAccessoryInstance?.arm?.encodeAsHTML()}</g:link></td>

                </tr>

                </tbody>
            </table>
        </div>
    </fieldset>
</div>
</body>
</html>
