<%@ page import="ru.gbuz.ao.privolgie.app.site.PatientInformation" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="patientInformation.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menupatientinformation"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="patientInformation.create"/></g:link></span>
    </div>
     <div class="list">
    <fieldset class="ui-corner-all">
        <legend><g:message code="patientInformation.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
       
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'patientInformation.title', default: 'Title')}"/>

                    <g:sortableColumn property="dateInfo"
                                      title="${message(code: 'patientInformation.dateinfo', default: 'Dateinfo')}"/>

                    <g:sortableColumn property="visible"
                                      title="${message(code: 'patientInformation.visible', default: 'Visible')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${patientInformationInstanceList}" status="i" var="patientInformationInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${patientInformationInstance.id}">${fieldValue(bean: patientInformationInstance, field: "title")}</g:link></td>

                        <td><g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                                          date="${patientInformationInstance.dateInfo}"/></td>

                        <td><g:formatBoolean boolean="${patientInformationInstance.visible}"/></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
       

        <div class="paginateButtons">
            <g:paginate total="${patientInformationInstanceTotal}"/>
        </div>
    </fieldset>
     </div>
</div>
</body>
</html>
