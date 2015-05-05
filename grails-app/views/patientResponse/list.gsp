<%@ page import="ru.gbuz.ao.privolgie.app.site.PatientResponse" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="patientResponse.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="patientResponse.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="patientResponse.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'patientResponse.id', default: 'Id')}"/>

                    <g:sortableColumn property="patientFIO"
                                      title="${message(code: 'patientResponse.patientFIO', default: 'Patient FIO')}"/>

                    <g:sortableColumn property="addres"
                                      title="${message(code: 'patientResponse.addres', default: 'Addres')}"/>

                    <g:sortableColumn property="dateResponse"
                                      title="${message(code: 'patientResponse.dateResponse', default: 'Date Response')}"/>

                    <g:sortableColumn property="response"
                                      title="${message(code: 'patientResponse.response', default: 'Response')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${patientResponseInstanceList}" status="i" var="patientResponseInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${patientResponseInstance.id}">${fieldValue(bean: patientResponseInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: patientResponseInstance, field: "patientFIO")}</td>

                        <td>${fieldValue(bean: patientResponseInstance, field: "addres")}</td>

                        <td><g:formatDate date="${patientResponseInstance.dateResponse}"/></td>

                        <td>${fieldValue(bean: patientResponseInstance, field: "response")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${patientResponseInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
