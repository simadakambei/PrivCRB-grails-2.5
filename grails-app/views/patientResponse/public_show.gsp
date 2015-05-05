<%@ page import="ru.gbuz.ao.privolgie.app.site.PatientResponse" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="patientResponse.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <br/>

        <div class="dialog">
            <fieldset class="ui-corner-all">

                <div class="value">

                    <h4 class="ui-state-active otstup-left">${fieldValue(bean: patientResponseInstance, field: "patientFIO")}</h4>

                    <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${patientResponseInstance.dateResponse}"/>
                    <hr/>
                    ${raw(patientResponseInstance?.response)}
                </div>
            </fieldset>
        </div>
    </fieldset>
</div>
</body>
</html>
