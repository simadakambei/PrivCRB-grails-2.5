<%@ page import="ru.gbuz.ao.privolgie.app.site.Sanprosvet" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="sanprosvet.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="sanprosvet.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="sanprosvet.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'sanprosvet.id', default: 'Id')}"/>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'sanprosvet.title', default: 'Title')}"/>

                    <g:sortableColumn property="dateCreated"
                                      title="${message(code: 'sanprosvet.dateCreated', default: 'Date Created')}"/>

                    <th><g:message code="sanprosvet.author"
                                   default="Author"/></th>
                                   
                    <g:sortableColumn property="archive"
                                      title="${message(code: 'sanprosvet.archive', default: 'Archive')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${sanprosvetInstanceList}" status="i" var="sanprosvetInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${sanprosvetInstance.id}">${fieldValue(bean: sanprosvetInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: sanprosvetInstance, field: "title")}</td>

                        <td><g:formatDate locale="ru" format="dd.MM.yyyy" date="${sanprosvetInstance.dateCreated}"/></td>

                        <td>${fieldValue(bean: sanprosvetInstance, field: "author")}</td>

                        <td><g:formatBoolean boolean="${sanprosvetInstance.archive}"/></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${sanprosvetInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
