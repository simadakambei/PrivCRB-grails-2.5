<%@ page import="ru.gbuz.ao.privolgie.app.entity.District" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="district.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="district.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="district.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'district.title', default: 'Title')}"/>

                    <g:sortableColumn property="definition"
                                      title="${message(code: 'district.definition', default: 'Definition')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${districtInstanceList}" status="i" var="districtInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${districtInstance.id}">${fieldValue(bean: districtInstance, field: "title")}</g:link></td>

                        <td>${fieldValue(bean: districtInstance, field: "definition")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${districtInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
