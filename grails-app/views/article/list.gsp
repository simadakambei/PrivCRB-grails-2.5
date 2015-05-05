<%@ page import="ru.gbuz.ao.privolgie.app.site.Article" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="article.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="article.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="article.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'article.title', default: 'Title')}"/>

                    <g:sortableColumn property="dateCreated"
                                      title="${message(code: 'article.dateCreated', default: 'Date Created')}"/>

                    <th><g:message code="article.author"
                                   default="Author"/></th>

                    <g:sortableColumn property="mainPage"
                                      title="${message(code: 'article.mainPage', default: 'Main Page')}"/>

                    <g:sortableColumn property="mainPage"
                                      title="${message(code: 'article.medical', default: 'Medical')}"/>

                    <g:sortableColumn property="mainPage"
                                      title="${message(code: 'article.archive', default: 'Archive')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${articleInstanceList}" status="i" var="articleInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${articleInstance.id}">${fieldValue(bean: articleInstance, field: "title")}</g:link></td>

                        <td><g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${articleInstance.dateCreated}"/></td>

                        <td>${fieldValue(bean: articleInstance, field: "author")}</td>

                        <td><g:formatBoolean boolean="${articleInstance.mainPage}"/></td>

                        <td><g:formatBoolean boolean="${articleInstance.medical}"/></td>

                        <td><g:formatBoolean boolean="${articleInstance.archive}"/></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${articleInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
