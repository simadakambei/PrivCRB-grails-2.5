<%@ page import="ru.gbuz.ao.privolgie.app.site.RequestAnAppeal" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="requestAnAppeal.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="requestAnAppeal.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <br/>
        <div class="list">

            <fieldset class="ui-corner-all">

                <g:each in="${requestAnAppealInstanceList}" status="i" var="requestAnAppealInstance">
                    <fieldset class="ui-corner-all">
                        <div class="value">
                            <h5 class="ui-state-active otstup-left"><g:link action="public_show"
                                                                            id="${requestAnAppealInstance?.id}">${fieldValue(bean: requestAnAppealInstance, field: "requestFIO")}</g:link></h5>
                            <g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                                          date="${requestAnAppealInstance?.requestDate}"/>
                        </div>
                    </fieldset>
                </g:each>
            </fieldset>

        </div>

        <div class="paginateButtons">
            <g:paginate total="${requestAnAppealInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
