<%@ page import="ru.gbuz.ao.privolgie.app.entity.Department" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="department.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="department.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="department.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'department.id', default: 'Id')}"/>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'department.title', default: 'Title')}"/>

                    <th><g:message code="department.director"
                                   default="Director"/></th>

                    <g:sortableColumn property="addres"
                                      title="${message(code: 'department.addres', default: 'Addres')}"/>

                    <g:sortableColumn property="phone"
                                      title="${message(code: 'department.phone', default: 'Phone')}"/>

                    <g:sortableColumn property="email"
                                      title="${message(code: 'department.email', default: 'Email')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${departmentInstanceList}" status="i" var="departmentInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${departmentInstance.id}">${fieldValue(bean: departmentInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: departmentInstance, field: "title")}</td>

                        <td>${fieldValue(bean: departmentInstance, field: "director")}</td>

                        <td>${fieldValue(bean: departmentInstance, field: "addres")}</td>

                        <td>${fieldValue(bean: departmentInstance, field: "phone")}</td>

                        <td>${fieldValue(bean: departmentInstance, field: "email")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${departmentInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
