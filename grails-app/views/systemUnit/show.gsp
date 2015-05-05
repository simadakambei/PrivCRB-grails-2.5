<%@ page import="ru.gbuz.ao.privolgie.app.inventory.SystemUnit" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="systemUnit.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="systemUnit.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="systemUnit.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="systemUnit.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="systemUnit.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: systemUnitInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="systemUnit.title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: systemUnitInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="systemUnit.inventNumber"
                                                             default="Invent Number"/></td>

                    <td valign="top" class="value">${fieldValue(bean: systemUnitInstance, field: "inventNumber")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="systemUnit.definition"
                                                             default="Definition"/></td>

                    <td valign="top" class="value">${fieldValue(bean: systemUnitInstance, field: "definition")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="systemUnit.arm"
                                                             default="Arm"/></td>

                    <td valign="top" class="value"><g:link controller="ARM"
                                                           action="show"
                                                           id="${systemUnitInstance?.arm?.id}">${systemUnitInstance?.arm?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="systemUnit.stickerWindows"
                                                             default="Sticker Windows"/></td>

                    <td valign="top" class="value"><g:formatBoolean
                            boolean="${systemUnitInstance?.stickerWindows}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="systemUnit.accessories"
                                                             default="Accessories"/></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <g:if test="${systemUnitInstance.accessories}">
                            <ul>
                                <g:each in="${systemUnitInstance.accessories}" var="a">
                                    <li><g:link controller="computerAccessory" action="show"
                                                id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                            <hr/>
                        </g:if>
                        <g:link controller="computerAccessory" action="add" params="['systemUnit': params.id]">
                            <g:message code="systemUnit.add.accessory"/>
                        </g:link>
                    </td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${systemUnitInstance?.id}"/>
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </g:form>
        </div>
    </fieldset>
</div>
</body>
</html>
