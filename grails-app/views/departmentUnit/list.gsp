<%@ page import="ru.gbuz.ao.privolgie.app.entity.DepartmentUnit" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="departmentUnit.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="departmentUnit.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="departmentUnit.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'departmentUnit.id', default: 'Id')}"/>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'departmentUnit.title', default: 'Title')}"/>

                    <th><g:message code="departmentUnit.director"
                                   default="Director"/></th>

                    <g:sortableColumn property="addres"
                                      title="${message(code: 'departmentUnit.addres', default: 'Addres')}"/>

                    <g:sortableColumn property="phone"
                                      title="${message(code: 'departmentUnit.phone', default: 'Phone')}"/>

                    <g:sortableColumn property="email"
                                      title="${message(code: 'departmentUnit.email', default: 'Email')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${departmentUnitInstanceList}" status="i" var="departmentUnitInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${departmentUnitInstance.id}">${fieldValue(bean: departmentUnitInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: departmentUnitInstance, field: "title")}</td>

                        <td>${fieldValue(bean: departmentUnitInstance, field: "director")}</td>

                        <td>${fieldValue(bean: departmentUnitInstance, field: "addres")}</td>

                        <td>${fieldValue(bean: departmentUnitInstance, field: "phone")}</td>

                        <td>${fieldValue(bean: departmentUnitInstance, field: "email")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${departmentUnitInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
