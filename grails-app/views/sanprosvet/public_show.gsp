<%@ page import="ru.gbuz.ao.privolgie.app.site.Sanprosvet" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="sanprosvet.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <br/>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <fieldset class="ui-corner-all">
            <div class="value">
                <h4 class="ui-state-active otstup-left">${fieldValue(bean: sanprosvetInstance, field: "title")}</h4>
                <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${sanprosvetInstance.dateCreated}"/>
                <hr/>
                ${raw(sanprosvetInstance?.content)}
            </div>
        </fieldset>
    </fieldset>
</div>
</body>
</html>
