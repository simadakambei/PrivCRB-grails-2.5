<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ComputerAccessory" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="computerAccessory.edit"/></title>
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
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="computerAccessory.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="computerAccessory.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${computerAccessoryInstance}">
            <div class="errors">
                <g:renderErrors bean="${computerAccessoryInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <g:hiddenField name="id" value="${computerAccessoryInstance?.id}"/>
            <g:hiddenField name="version" value="${computerAccessoryInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="product"><g:message code="computerAccessory.product"
                                                            default="Product"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: computerAccessoryInstance, field: 'product', 'errors')}">
                            <g:select name="product.id" from="${ru.gbuz.ao.privolgie.vocs.Product.list()}"
                                      optionKey="id" value="${computerAccessoryInstance?.product?.id}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="manufacturer"><g:message code="computerAccessory.manufacturer"
                                                                 default="Manufacturer"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: computerAccessoryInstance, field: 'manufacturer', 'errors')}">
                            <g:select name="manufacturer.id" from="${ru.gbuz.ao.privolgie.vocs.Manufacturer.list()}"
                                      optionKey="id" value="${computerAccessoryInstance?.manufacturer?.id}"
                                      noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="computerAccessoryType"><g:message code="computerAccessory.computerAccessoryType"
                                                                          default="Computer Accessory Type"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: computerAccessoryInstance, field: 'computerAccessoryType', 'errors')}">
                            <g:select name="computerAccessoryType.id"
                                      from="${ru.gbuz.ao.privolgie.vocs.ComputerAccessoryType.list()}" optionKey="id"
                                      value="${computerAccessoryInstance?.computerAccessoryType?.id}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="systemUnit"><g:message code="computerAccessory.systemUnit"
                                                               default="System Unit"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: computerAccessoryInstance, field: 'systemUnit', 'errors')}">
                            <g:select name="systemUnit.id"
                                      from="${ru.gbuz.ao.privolgie.app.inventory.SystemUnit.list()}" optionKey="id"
                                      value="${computerAccessoryInstance?.systemUnit?.id}" noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="specification"><g:message code="computerAccessory.specification"
                                                                  default="Specification"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: computerAccessoryInstance, field: 'specification', 'errors')}">
                            <g:textArea name="specification" rows="5" cols="40"
                                        value="${fieldValue(bean: computerAccessoryInstance, field: 'specification')}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="save" action="update"
                                                     value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
