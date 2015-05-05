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
            <g:each in="${patientResponseInstanceList}" status="i" var="patientResponseInstance">
                <fieldset class="ui-corner-all">

                    <div class="value">

                        <h4 class="ui-state-active otstup-left"><g:link action="public_show"
                                                                        id="${patientResponseInstance?.id}">${fieldValue(bean: patientResponseInstance, field: "patientFIO")}</g:link></h4>

                        <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${patientResponseInstance.dateResponse}"/>
                        <hr/>
                        ${raw(patientResponseInstance?.response)}
                    </div>
                </fieldset>
            </g:each>

        </div>

        <div class="paginateButtons">
            <g:paginate total="${patientResponseInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
