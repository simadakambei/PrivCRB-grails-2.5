<%@ page import="ru.gbuz.ao.privolgie.vocs.Link" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="link.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="link.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="link.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="link.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${linkInstance}">
            <div class="errors">
                <g:renderErrors bean="${linkInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <g:hiddenField name="id" value="${linkInstance?.id}"/>
            <g:hiddenField name="version" value="${linkInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name"><g:message code="link.name"
                                                         default="Name"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: linkInstance, field: 'name', 'errors')}">
                            <g:textField name="name" value="${fieldValue(bean: linkInstance, field: 'name')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="url"><g:message code="link.url"
                                                        default="Url"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: linkInstance, field: 'url', 'errors')}">
                            <g:textField name="url" value="${fieldValue(bean: linkInstance, field: 'url')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="link.definition"
                                                               default="Definition"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: linkInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: linkInstance, field: 'definition')}"/>

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
