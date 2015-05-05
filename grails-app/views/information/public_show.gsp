<%@ page import="ru.gbuz.ao.privolgie.app.site.Information" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="information.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menuinformation"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="public_list"><g:message
                code="information.back.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">

        <h4 class="ui-state-active otstup-left">${fieldValue(bean: informationInstance, field: "title")}</h4>

        <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${informationInstance.dateinfo}"/>
        <hr/>
        ${raw(informationInstance?.content)}

    </fieldset>
</div>
</body>
</html>
