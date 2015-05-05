<%@ page import="ru.gbuz.ao.privolgie.vocs.OfficialPost" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'officialPost.label', default: 'OfficialPost')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-officialPost" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                   default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-officialPost" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="title" title="${message(code: 'officialPost.title.label', default: 'Title')}"/>

            <th><g:message code="officialPost.person.label" default="Person"/></th>

            <g:sortableColumn property="definition"
                              title="${message(code: 'officialPost.definition.label', default: 'Definition')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${officialPostInstanceList}" status="i" var="officialPostInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${officialPostInstance.id}">${fieldValue(bean: officialPostInstance, field: "title")}</g:link></td>

                <td>${fieldValue(bean: officialPostInstance, field: "person")}</td>

                <td>${fieldValue(bean: officialPostInstance, field: "definition")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${officialPostInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
