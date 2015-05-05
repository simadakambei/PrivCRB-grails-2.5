<%@ page import="ru.gbuz.ao.privolgie.app.inventory.SystemUnit" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="systemUnit.create"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="systemUnit.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="systemUnit.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${systemUnitInstance}">
            <div class="errors">
                <g:renderErrors bean="${systemUnitInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="systemUnit.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: systemUnitInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: systemUnitInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="inventNumber"><g:message code="systemUnit.inventNumber"
                                                                 default="Invent Number"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: systemUnitInstance, field: 'inventNumber', 'errors')}">
                            <g:textField name="inventNumber"
                                         value="${fieldValue(bean: systemUnitInstance, field: 'inventNumber')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="systemUnit.definition"
                                                               default="Definition"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: systemUnitInstance, field: 'definition', 'errors')}">
                            <g:textArea row="5" cols="15" name="definition"
                                        value="${fieldValue(bean: systemUnitInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="arm"><g:message code="systemUnit.arm"
                                                        default="Arm"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: systemUnitInstance, field: 'arm', 'errors')}">
                            <g:select name="arm.id" from="${ru.gbuz.ao.privolgie.app.inventory.ARM.list()}"
                                      optionKey="id" value="${systemUnitInstance?.arm?.id}"
                                      noSelection="['null': '- Выбор АРМ -']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="stickerWindows"><g:message code="systemUnit.stickerWindows"
                                                                   default="Sticker Windows"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: systemUnitInstance, field: 'stickerWindows', 'errors')}">
                            <g:checkBox name="stickerWindows" value="${systemUnitInstance?.stickerWindows}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:submitButton name="create" class="save"
                                                     value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
