<%@ page import="ru.gbuz.ao.privolgie.vocs.PatientInformationType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="patientInformationType.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="patientInformationType.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="patientInformationType.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'patientInformationType.id', default: 'Id')}"/>

                    <g:sortableColumn property="name"
                                      title="${message(code: 'patientInformationType.name', default: 'Name')}"/>

                    <g:sortableColumn property="code"
                                      title="${message(code: 'patientInformationType.code', default: 'Code')}"/>

                    <g:sortableColumn property="definition"
                                      title="${message(code: 'patientInformationType.definition', default: 'Definition')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${patientInformationTypeInstanceList}" status="i" var="patientInformationTypeInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${patientInformationTypeInstance.id}">${fieldValue(bean: patientInformationTypeInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: patientInformationTypeInstance, field: "name")}</td>

                        <td>${fieldValue(bean: patientInformationTypeInstance, field: "code")}</td>

                        <td>${fieldValue(bean: patientInformationTypeInstance, field: "definition")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${patientInformationTypeInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
