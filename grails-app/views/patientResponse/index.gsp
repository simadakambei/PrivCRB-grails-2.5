<%@ page import="ru.gbuz.ao.privolgie.app.site.PatientResponse" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'patientResponse.label', default: 'PatientResponse')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-patientResponse" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                      default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-patientResponse" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="patientFIO"
                              title="${message(code: 'patientResponse.patientFIO.label', default: 'Patient FIO')}"/>

            <g:sortableColumn property="addres"
                              title="${message(code: 'patientResponse.addres.label', default: 'Addres')}"/>

            <g:sortableColumn property="dateResponse"
                              title="${message(code: 'patientResponse.dateResponse.label', default: 'Date Response')}"/>

            <g:sortableColumn property="response"
                              title="${message(code: 'patientResponse.response.label', default: 'Response')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${patientResponseInstanceList}" status="i" var="patientResponseInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${patientResponseInstance.id}">${fieldValue(bean: patientResponseInstance, field: "patientFIO")}</g:link></td>

                <td>${fieldValue(bean: patientResponseInstance, field: "addres")}</td>

                <td><g:formatDate date="${patientResponseInstance.dateResponse}"/></td>

                <td>${fieldValue(bean: patientResponseInstance, field: "response")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${patientResponseInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
