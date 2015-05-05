<%@ page import="ru.gbuz.ao.privolgie.vocs.ExternalAccessoryType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="externalAccessoryType.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="externalAccessoryType.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="externalAccessoryType.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'externalAccessoryType.title', default: 'Title')}"/>

                    <g:sortableColumn property="eng_title"
                                      title="${message(code: 'externalAccessoryType.eng_title', default: 'Engtitle')}"/>

                    <g:sortableColumn property="definition"
                                      title="${message(code: 'externalAccessoryType.definition', default: 'Definition')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${externalAccessoryTypeInstanceList}" status="i" var="externalAccessoryTypeInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${externalAccessoryTypeInstance.id}">${fieldValue(bean: externalAccessoryTypeInstance, field: "title")}</g:link></td>

                        <td>${fieldValue(bean: externalAccessoryTypeInstance, field: "eng_title")}</td>

                        <td>${fieldValue(bean: externalAccessoryTypeInstance, field: "definition")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${externalAccessoryTypeInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
