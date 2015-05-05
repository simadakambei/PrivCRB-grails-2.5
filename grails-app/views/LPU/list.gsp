<%@ page import="ru.gbuz.ao.privolgie.app.entity.LPU" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="LPU.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="LPU.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="LPU.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'LPU.title', default: 'Title')}"/>

                    <th><g:message code="LPU.director"
                                   default="Director"/></th>

                    <g:sortableColumn property="addres"
                                      title="${message(code: 'LPU.addres', default: 'Addres')}"/>

                    <g:sortableColumn property="phone"
                                      title="${message(code: 'LPU.phone', default: 'Phone')}"/>

                    <g:sortableColumn property="email"
                                      title="${message(code: 'LPU.email', default: 'Email')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${LPUInstanceList}" status="i" var="LPUInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${LPUInstance.id}">${fieldValue(bean: LPUInstance, field: "title")}</g:link></td>

                        <td>${fieldValue(bean: LPUInstance, field: "director")}</td>

                        <td>${fieldValue(bean: LPUInstance, field: "addres")}</td>

                        <td>${fieldValue(bean: LPUInstance, field: "phone")}</td>

                        <td>${fieldValue(bean: LPUInstance, field: "email")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${LPUInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
