<%@ page import="ru.gbuz.ao.privolgie.vocs.ComputerAccessoryType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="computerAccessoryType.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="computerAccessoryType.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="computerAccessoryType.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'computerAccessoryType.title', default: 'Title')}"/>

                    <g:sortableColumn property="eng_title"
                                      title="${message(code: 'computerAccessoryType.eng_title', default: 'Engtitle')}"/>

                    <g:sortableColumn property="definition"
                                      title="${message(code: 'computerAccessoryType.definition', default: 'Definition')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${computerAccessoryTypeInstanceList}" status="i" var="computerAccessoryTypeInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${computerAccessoryTypeInstance.id}">${fieldValue(bean: computerAccessoryTypeInstance, field: "title")}</g:link></td>

                        <td>${fieldValue(bean: computerAccessoryTypeInstance, field: "eng_title")}</td>

                        <td>${fieldValue(bean: computerAccessoryTypeInstance, field: "definition")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${computerAccessoryTypeInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
