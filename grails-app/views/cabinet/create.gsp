<%@ page import="ru.gbuz.ao.privolgie.app.entity.Cabinet" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="cabinet.create"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="cabinet.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="cabinet.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${cabinetInstance}">
            <div class="errors">
                <g:renderErrors bean="${cabinetInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="cabinet.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: cabinetInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: cabinetInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="number"><g:message code="cabinet.number"
                                                           default="Number"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: cabinetInstance, field: 'number', 'errors')}">
                            <g:textField name="number" value="${fieldValue(bean: cabinetInstance, field: 'number')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="cabinet.definition"
                                                               default="Definition"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: cabinetInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: cabinetInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="unit"><g:message code="cabinet.unit"
                                                         default="Unit"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: cabinetInstance, field: 'unit', 'errors')}">
                            <g:select name="unit.id" from="${ru.gbuz.ao.privolgie.app.entity.DepartmentUnit.list()}"
                                      optionKey="id" value="${cabinetInstance?.unit?.id}"
                                      noSelection="['null': '- Выберите отделение -']"/>

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
