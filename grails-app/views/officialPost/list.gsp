<%@ page import="ru.gbuz.ao.privolgie.vocs.OfficialPost" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="officialPost.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="officialPost.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="officialPost.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'officialPost.id', default: 'Id')}"/>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'officialPost.title', default: 'Title')}"/>

                    <th><g:message code="officialPost.person"
                                   default="Person"/></th>

                    <g:sortableColumn property="definition"
                                      title="${message(code: 'officialPost.definition', default: 'Definition')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${officialPostInstanceList}" status="i" var="officialPostInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${officialPostInstance.id}">${fieldValue(bean: officialPostInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: officialPostInstance, field: "title")}</td>

                        <td>${fieldValue(bean: officialPostInstance, field: "person")}</td>

                        <td>${fieldValue(bean: officialPostInstance, field: "definition")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${officialPostInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
