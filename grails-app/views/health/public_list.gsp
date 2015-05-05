<%@ page import="ru.gbuz.ao.privolgie.app.site.Sanprosvet" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="health.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <legend><g:message code="health.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:each in="${healthInstanceList}" var="healthInstance">
            <fieldset class="ui-corner-all">
                <div class="value">

                    <h4 class="ui-state-active otstup-left">${fieldValue(bean: healthInstance, field: "title")}</h4>

                    <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${healthInstance.dateCreated}"/>
                    <hr/>
                    ${healthInstance?.title} .... | &nbsp;&nbsp;<g:link
                        id="${healthInstance.id}" action="public_show"><strong>Подробнее</strong></g:link>
                </div>
            </fieldset>
        </g:each>
        <div class="paginateButtons">
            <g:paginate total="${healthInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
