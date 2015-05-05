<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ARM" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="ARM.create"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="ARM.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="ARM.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${ARMInstance}">
            <div class="errors">
                <g:renderErrors bean="${ARMInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name"><g:message code="ARM.name"
                                                         default="Name"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: ARMInstance, field: 'name', 'errors')}">
                            <g:textField size="40" name="name" value="${fieldValue(bean: ARMInstance, field: 'name')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="cabinet"><g:message code="ARM.cabinet"
                                                            default="Cabinet"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: ARMInstance, field: 'cabinet', 'errors')}">
                            <g:select name="cabinet.id" from="${ru.gbuz.ao.privolgie.app.entity.Cabinet.list()}"
                                      optionKey="id" value="${ARMInstance?.cabinet?.id}"
                                      noSelection="['null': '- Выбор кабинета -']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="systemUnit"><g:message code="ARM.systemUnit"
                                                               default="System Unit"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: ARMInstance, field: 'systemUnit', 'errors')}">
                            <g:select name="systemUnit.id"
                                      from="${ru.gbuz.ao.privolgie.app.inventory.SystemUnit.list()}" optionKey="id"
                                      value="${ARMInstance?.systemUnit?.id}"
                                      noSelection="['null': '- Выбор системного блока -']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="specialist"><g:message code="ARM.specialist"
                                                               default="Specialist"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: ARMInstance, field: 'specialist', 'errors')}">
                            <g:select name="specialist.id" from="${ru.gbuz.ao.privolgie.app.entity.Specialist.list()}"
                                      optionKey="id" value="${ARMInstance?.specialist?.id}"
                                      noSelection="['null': '- Выбор специалиста -']"/>

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
