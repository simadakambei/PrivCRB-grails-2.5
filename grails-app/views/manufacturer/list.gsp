<%@ page import="ru.gbuz.ao.privolgie.vocs.Manufacturer" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="manufacturer.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="manufacturer.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="manufacturer.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'manufacturer.title', default: 'Title')}"/>

                    <g:sortableColumn property="description"
                                      title="${message(code: 'manufacturer.description', default: 'Description')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${manufacturerInstanceList}" status="i" var="manufacturerInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${manufacturerInstance.id}">${fieldValue(bean: manufacturerInstance, field: "title")}</g:link></td>

                        <td>${fieldValue(bean: manufacturerInstance, field: "description")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${manufacturerInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
