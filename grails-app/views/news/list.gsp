<%@ page import="ru.gbuz.ao.privolgie.app.site.News" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="news.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="news.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="news.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'news.title', default: 'Title')}"/>

                    <g:sortableColumn property="dateCreated"
                                      title="${message(code: 'news.dateCreated', default: 'Date Created')}"/>

                    <th><g:message code="news.author"
                                   default="Author"/></th>

                    <g:sortableColumn property="mainPage"
                                      title="${message(code: 'news.mainPage', default: 'Main Page')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${newsInstanceList}" status="i" var="newsInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${newsInstance.id}">${fieldValue(bean: newsInstance, field: "title")}</g:link></td>

                        <td><g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${newsInstance.dateCreated}"/></td>

                        <td>${fieldValue(bean: newsInstance, field: "author")}</td>

                        <td><g:formatBoolean boolean="${newsInstance.mainPage}"/></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${newsInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
