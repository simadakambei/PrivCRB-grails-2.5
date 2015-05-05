<%@ page import="ru.gbuz.ao.privolgie.app.site.Information" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="information.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menuinformation"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="information.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="information.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        
        <div class="list">
            <g:each in="${informationInstanceList}" status="i" var="informationInstance">
                <fieldset class="ui-corner-all">
                    <h4 class="ui-state-active otstup-left">${fieldValue(bean: informationInstance, field: "title")}</h4>

                    <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${informationInstance.dateinfo}"/>
                    <hr/>
                    ${raw(informationInstance?.content)} ... |
                    <g:link action="show"
                            id="${informationInstance.id}"><g:message code="default.detail.label"/></g:link>
                </fieldset>
            </g:each>

        </div>

        <div class="paginateButtons">
            <g:paginate total="${informationInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>

