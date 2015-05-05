<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="authority.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="authority.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="authority.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <table>
            <thead class="ui-state-default center">
            <tr>
                <g:sortableColumn property="authority"
                                  title="${message(code: 'authority.authority', default: 'Authority')}"/>
                <g:sortableColumn property="description"
                                  title="${message(code: 'authority.description', default: 'Description')}"/>
            </tr>
            </thead>
            <tbody>
            <g:each in="${ru.gbuz.ao.privolgie.security.Authority.list()}" status="i" var="authority">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td><g:link action="show"
                                id="${authority.id}">${authority.authority}</g:link></td>
                    <td>${authority.description}</td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${authorityInstanceCount}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
