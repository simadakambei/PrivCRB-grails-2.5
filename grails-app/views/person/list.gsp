<%@ page import="ru.gbuz.ao.privolgie.security.Person" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="person.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="person.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="person.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="username" title="${message(code: 'person.username', default: 'Username')}"/>

                <g:sortableColumn property="fullname"
                                  title="${message(code: 'person.userRealName', default: 'Fullname')}"/>

                <g:sortableColumn property="accountExpired"
                                  title="${message(code: 'person.accountExpired', default: 'Account Expired')}"/>

                <g:sortableColumn property="accountLocked"
                                  title="${message(code: 'person.accountLocked', default: 'Account Locked')}"/>

                <g:sortableColumn property="enabled" title="${message(code: 'person.enabled', default: 'Enabled')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${personInstanceList}" status="i" var="personInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${personInstance.id}">${fieldValue(bean: personInstance, field: "username")}</g:link></td>

                    <td>${fieldValue(bean: personInstance, field: "fullname")}</td>

                    <td><g:formatBoolean boolean="${personInstance.accountExpired}"/></td>

                    <td><g:formatBoolean boolean="${personInstance.accountLocked}"/></td>

                    <td><g:formatBoolean boolean="${personInstance.enabled}"/></td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${personInstanceCount}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
