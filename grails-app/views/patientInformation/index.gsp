<%@ page import="ru.gbuz.ao.privolgie.app.site.PatientInformation" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'patientInformation.label', default: 'PatientInformation')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-patientInformation" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                         default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-patientInformation" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="title"
                              title="${message(code: 'patientInformation.title.label', default: 'Title')}"/>

            <g:sortableColumn property="dateInfo"
                              title="${message(code: 'patientInformation.dateinfo.label', default: 'DateInfo')}"/>

            <g:sortableColumn property="content"
                              title="${message(code: 'patientInformation.content.label', default: 'Content')}"/>

            <g:sortableColumn property="visible"
                              title="${message(code: 'patientInformation.visible.label', default: 'Visible')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${patientInformationInstanceList}" status="i" var="patientInformationInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${patientInformationInstance.id}">${fieldValue(bean: patientInformationInstance, field: "title")}</g:link></td>

                <td><g:formatDate date="${patientInformationInstance.dateInfo}"/></td>

                <td>${raw(patientInformationInstance?.content)}</td>

                <td><g:formatBoolean boolean="${patientInformationInstance.visible}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${patientInformationInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
