<%@ page import="ru.gbuz.ao.privolgie.app.site.Health" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="health.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="health.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="health.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'health.id', default: 'Id')}"/>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'health.title', default: 'Title')}"/>

                    <g:sortableColumn property="dateCreated"
                                      title="${message(code: 'health.dateCreated', default: 'Date Created')}"/>

                    <th><g:message code="health.author"
                                   default="Author"/></th>

                    <g:sortableColumn property="content"
                                      title="${message(code: 'health.content', default: 'Content')}"/>

                    <g:sortableColumn property="archive"
                                      title="${message(code: 'health.archive', default: 'Archive')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${healthInstanceList}" status="i" var="healthInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${healthInstance.id}">${fieldValue(bean: healthInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: healthInstance, field: "title")}</td>

                        <td><g:formatDate date="${healthInstance.dateCreated}"/></td>

                        <td>${fieldValue(bean: healthInstance, field: "author")}</td>

                        <td>${raw(healthInstance?.content)}</td>

                        <td><g:formatBoolean boolean="${healthInstance.archive}"/></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${healthInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
