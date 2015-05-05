<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="person.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="person.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="person.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="person.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${personInstance}">
            <div class="errors">
                <g:renderErrors bean="${personInstance}" as="list"/>
            </div>
        </g:hasErrors>

        <g:form method="post">
            <g:hiddenField name="id" value="${personInstance?.id}"/>
            <g:hiddenField name="version" value="${personInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name required">
                            <label class="required" for="username"><g:message code="person.username"
                                                                              default="User name"/><span
                                    class="required">*</span></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: personInstance, field: 'username', 'errors')}">
                            <g:textField size="40" name="username"
                                         value="${fieldValue(bean: personInstance, field: 'username')}"/>

                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name required">
                            <label class="required" for="fullname"><g:message code="person.userRealName"
                                                                              default="Full name"/><span
                                    class="required">*</span></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: personInstance, field: 'fullname', 'errors')}">
                            <g:textField size="40" name="fullname"
                                         value="${fieldValue(bean: personInstance, field: 'fullname')}"/>

                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name required">
                            <label class="required" for="password"><g:message code="person.password"
                                                                              default="Password"/><span
                                    class="required">*</span></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: personInstance, field: 'password', 'errors')}">
                            <g:textField size="40" name="password"
                                         value="${fieldValue(bean: personInstance, field: 'password')}"/>

                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name required">
                            <label class="required" for="accountExpired"><g:message code="person.accountExpired"
                                                                                    default="Account Expired"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: personInstance, field: 'accountExpired', 'errors')}">
                            <g:checkBox name="accountExpired" value="${personInstance?.accountExpired}"/>

                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name required">
                            <label class="required" for="accountLocked"><g:message code="person.accountLocked"
                                                                                   default="Account Locked"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: personInstance, field: 'accountLocked', 'errors')}">
                            <g:checkBox name="accountExpired" value="${personInstance?.accountLocked}"/>

                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name required">
                            <label class="required" for="enabled"><g:message code="person.enabled"
                                                                             default="Enabled"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: personInstance, field: 'enabled', 'errors')}">
                            <g:checkBox name="enabled" value="${personInstance?.enabled}"/>

                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name required">
                            <label class="required" for="passwordExpired"><g:message code="person.passwordExpired"
                                                                                     default="Password Expired"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: personInstance, field: 'passwordExpired', 'errors')}">
                            <g:checkBox name="accountExpired" value="${personInstance?.passwordExpired}"/>

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
