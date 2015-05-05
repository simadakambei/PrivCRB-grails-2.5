<%@ page import="ru.gbuz.ao.privolgie.vocs.Link" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="link.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="link.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="link.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="name"
                                      title="${message(code: 'link.name', default: 'Name')}"/>

                    <g:sortableColumn property="url"
                                      title="${message(code: 'link.url', default: 'Url')}"/>

                    <g:sortableColumn property="definition"
                                      title="${message(code: 'link.definition', default: 'Definition')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${linkInstanceList}" status="i" var="linkInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${linkInstance.id}">${fieldValue(bean: linkInstance, field: "name")}</g:link></td>

                        <td>${fieldValue(bean: linkInstance, field: "url")}</td>

                        <td>${fieldValue(bean: linkInstance, field: "definition")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${linkInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
