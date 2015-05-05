<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ARM" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="ARM.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="ARM.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="ARM.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="breadCrumbHolder module">
            <div id="breadCrumb" class="breadCrumb module"></div>
        </div>

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'ARM.id', default: 'Id')}"/>

                    <g:sortableColumn property="name"
                                      title="${message(code: 'ARM.name', default: 'Name')}"/>

                    <th><g:message code="ARM.cabinet"
                                   default="Cabinet"/></th>

                    <th><g:message code="ARM.systemUnit"
                                   default="System Unit"/></th>

                    <th><g:message code="ARM.specialist"
                                   default="Specialist"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${ARMInstanceList}" status="i" var="ARMInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${ARMInstance.id}">${fieldValue(bean: ARMInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: ARMInstance, field: "name")}</td>

                        <td>${fieldValue(bean: ARMInstance, field: "cabinet")}</td>

                        <td>${fieldValue(bean: ARMInstance, field: "systemUnit")}</td>

                        <td>${fieldValue(bean: ARMInstance, field: "specialist")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${ARMInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
