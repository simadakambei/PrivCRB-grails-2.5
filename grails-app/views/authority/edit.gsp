<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="authority.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="authority.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="authority.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${authorityInstance}">
            <div class="errors">
                <g:renderErrors bean="${authorityInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form method="post">
            <g:hiddenField name="id" value="${authorityInstance?.id}"/>
            <g:hiddenField name="version" value="${authorityInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name required">
                            <label class="required" for="authority"><g:message code="authority.authority"
                                                                               default="Authority"/><span
                                    class="required">*</span></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: authorityInstance, field: 'authority', 'errors')}">
                            <g:textField size="40" name="authority"
                                         value="${fieldValue(bean: authorityInstance, field: 'authority')}"/>

                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name required">
                            <label class="required" for="description"><g:message code="authority.description"
                                                                                 default="Description"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: authorityInstance, field: 'description', 'errors')}">
                            <g:textField size="40" name="description"
                                         value="${fieldValue(bean: authorityInstance, field: 'description')}"/>

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
