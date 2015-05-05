<%@ page import="ru.gbuz.ao.privolgie.app.site.LicenseLPU" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="licenseLPU.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menulicenselpu"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <legend><g:message code="licenseLPU.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        
        <div class="list">

            <g:each in="${licenseLPUInstanceList}" status="i" var="licenseLPUInstance">
                <fieldset class="ui-corner-all">
                    <h4 class="ui-state-active otstup-left">
                        ${fieldValue(bean: licenseLPUInstance, field: "title")}</h4>

                    <hr/>
                    <g:message code="licenseLPU.dateBegin"/> :
                    <g:formatDate format="dd MMMMMMMM yyyy" date="${licenseLPUInstance.dateBegin}"/>
                    <hr/>
                    <g:message code="licenseLPU.dateEnd"/> :
                    <g:formatDate format="dd MMMMMMMM yyyy" date="${licenseLPUInstance.dateEnd}"/>
                    <hr/>
                    <fieldset class="odd ui-corner-all">
                        ${raw(licenseLPUInstance?.definition)}
                    </fieldset>
                    <g:link action="public_show" id="${licenseLPUInstance?.id}">... | <g:message
                            code="default.detail.label"/></g:link>

                </fieldset>
            </g:each>

        </div>

        <div class="paginateButtons">
            <g:paginate total="${licenseLPUInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
