<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ExternalAccessory" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="externalAccessory.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list">
            <g:message code="externalAccessory.list"/>
        </g:link></span> <span class="menuButton"><g:link class="create"
                                                          action="create">
        <g:message code="externalAccessory.create"/>
    </g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend>
            <g:message code="externalAccessory.edit"/>
        </legend>

        <g:if test="${flash.message}">
            <div class="message">
                ${flash.message}
            </div>
        </g:if>
        <g:hasErrors bean="${externalAccessoryInstance}">
            <div class="errors">
                <g:renderErrors bean="${externalAccessoryInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <g:hiddenField name="id" value="${externalAccessoryInstance?.id}"/>
            <g:hiddenField name="version"
                           value="${externalAccessoryInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name"><label for="product"><g:message
                                code="externalAccessory.product" default="Product"/></label></td>
                        <td valign="top"
                            class="value ${hasErrors(bean: externalAccessoryInstance, field: 'product', 'errors')}">
                            <g:select name="product.id"
                                      from="${ru.gbuz.ao.privolgie.vocs.Product.list()}"
                                      optionKey="id"
                                      noSelection="['null': '- Выбор наименования продукта -']"
                                      value="${externalAccessoryInstance?.product?.id}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><label
                                for="externalAccessoryType"><g:message
                                    code="externalAccessory.externalAccessoryType"
                                    default="External Accessory Type"/></label></td>
                        <td valign="top"
                            class="value ${hasErrors(bean: externalAccessoryInstance, field: 'externalAccessoryType', 'errors')}">
                            <g:select name="externalAccessoryType.id"
                                      from="${ru.gbuz.ao.privolgie.vocs.ExternalAccessoryType.list()}"
                                      optionKey="id"
                                      noSelection="['null': '- Выбор типа внешнего устройства -']"
                                      value="${externalAccessoryInstance?.externalAccessoryType?.id}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><label for="inventNumber"><g:message
                                code="externalAccessory.inventNumber" default="Invent Number"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: externalAccessoryInstance, field: 'inventNumber', 'errors')}">
                            <g:textField name="inventNumber"
                                         value="${fieldValue(bean: externalAccessoryInstance, field: 'inventNumber')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><label for="arm"><g:message
                                code="externalAccessory.arm" default="Arm"/></label></td>
                        <td valign="top"
                            class="value ${hasErrors(bean: externalAccessoryInstance, field: 'arm', 'errors')}">
                            <g:select name="arm.id"
                                      from="${ru.gbuz.ao.privolgie.app.inventory.ARM.list()}"
                                      optionKey="id" value="${externalAccessoryInstance?.arm?.id}"
                                      noSelection="['null': '- Выбор АРМ -']"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="save"
                                                     action="update"
                                                     value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
                <span class="button"><g:actionSubmit class="delete"
                                                     action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
