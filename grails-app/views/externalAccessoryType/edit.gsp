<%@ page import="ru.gbuz.ao.privolgie.vocs.ExternalAccessoryType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="externalAccessoryType.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="externalAccessoryType.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="externalAccessoryType.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="externalAccessoryType.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${externalAccessoryTypeInstance}">
            <div class="errors">
                <g:renderErrors bean="${externalAccessoryTypeInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form method="post">
            <g:hiddenField name="id" value="${externalAccessoryTypeInstance?.id}"/>
            <g:hiddenField name="version" value="${externalAccessoryTypeInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="externalAccessoryType.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: externalAccessoryTypeInstance, field: 'title', 'errors')}">
                            <g:textField name="title"
                                         value="${fieldValue(bean: externalAccessoryTypeInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="eng_title"><g:message code="externalAccessoryType.eng_title"
                                                              default="Engtitle"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: externalAccessoryTypeInstance, field: 'eng_title', 'errors')}">
                            <g:textField name="eng_title"
                                         value="${fieldValue(bean: externalAccessoryTypeInstance, field: 'eng_title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="externalAccessoryType.definition"
                                                               default="Definition"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: externalAccessoryTypeInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: externalAccessoryTypeInstance, field: 'definition')}"/>

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
