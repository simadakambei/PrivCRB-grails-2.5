<%@ page import="ru.gbuz.ao.privolgie.security.Authority" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="authority.list"/></title>
</head>

<body>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="authority.new"/></g:link></li>
    </ul>
</div>

<div id="list-authority" class="content scaffold-list" role="main">
    <h1><g:message code="authority.list"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="authority"
                              title="${message(code: 'authority.show', default: 'Authority')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${authorityInstanceList}" status="i" var="authorityInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${authorityInstance.id}">${fieldValue(bean: authorityInstance, field: "authority")}</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${authorityInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
