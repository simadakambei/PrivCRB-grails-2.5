<%@ page import="ru.gbuz.ao.privolgie.app.entity.Cabinet" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="cabinet.edit"/></title>
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
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="cabinet.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="cabinet.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${cabinetInstance}">
            <div class="errors">
                <g:renderErrors bean="${cabinetInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <g:hiddenField name="id" value="${cabinetInstance?.id}"/>
            <g:hiddenField name="version" value="${cabinetInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="cabinet.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: cabinetInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: cabinetInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="number"><g:message code="cabinet.number"
                                                           default="Number"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: cabinetInstance, field: 'number', 'errors')}">
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
                        <td valign="top"
                            class="value ${hasErrors(bean: cabinetInstance, field: 'unit', 'errors')}">
                            <g:select name="unit.id" from="${ru.gbuz.ao.privolgie.app.entity.DepartmentUnit.list()}"
                                      optionKey="id" value="${cabinetInstance?.unit?.id}" noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="arms"><g:message code="cabinet.arms"
                                                         default="Arms"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: cabinetInstance, field: 'arms', 'errors')}">
                            <g:select name="arms"
                                      from="${ru.gbuz.ao.privolgie.app.inventory.ARM.list()}"
                                      size="5" multiple="yes" optionKey="id"
                                      value="${cabinetInstance?.arms}"/>

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
