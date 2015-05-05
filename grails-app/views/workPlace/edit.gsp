<%@ page import="ru.gbuz.ao.privolgie.vocs.WorkPlace" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="workPlace.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="workPlace.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="workPlace.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="workPlace.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${workPlaceInstance}">
            <div class="errors">
                <g:renderErrors bean="${workPlaceInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <g:hiddenField name="id" value="${workPlaceInstance?.id}"/>
            <g:hiddenField name="version" value="${workPlaceInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="workPlace.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: workPlaceInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: workPlaceInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="workPlace.definition"
                                                               default="Definition"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: workPlaceInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: workPlaceInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="specialist"><g:message code="workPlace.specialist"
                                                               default="Specialist"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: workPlaceInstance, field: 'specialist', 'errors')}">
                            <g:select name="specialist.id" from="${ru.gbuz.ao.privolgie.app.entity.Specialist.list()}"
                                      optionKey="id" value="${workPlaceInstance?.specialist?.id}"
                                      noSelection="['null': '- Выбор специалиста -']"/>

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
