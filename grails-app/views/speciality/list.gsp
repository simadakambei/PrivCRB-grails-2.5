<%@ page import="ru.gbuz.ao.privolgie.vocs.Speciality" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="speciality.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="speciality.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="speciality.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'speciality.title', default: 'Title')}"/>

                    <g:sortableColumn property="description"
                                      title="${message(code: 'speciality.description', default: 'Description')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${specialityInstanceList}" status="i" var="specialityInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${specialityInstance.id}">${fieldValue(bean: specialityInstance, field: "title")}</g:link></td>

                        <td>${fieldValue(bean: specialityInstance, field: "description")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${specialityInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
