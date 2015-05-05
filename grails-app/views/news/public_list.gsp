<%@ page import="ru.gbuz.ao.privolgie.app.site.News" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="news.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <legend><g:message code="news.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        
        <g:each in="${newsInstanceList.reverse(true)}" status="i" var="newsInstance">
            <fieldset class="ui-corner-all">

                <div class="value">

                    <h4 class="ui-state-active otstup-left">${fieldValue(bean: newsInstance, field: "title")}</h4>
                    <g:formatDate format="dd MMMMMMMM yyyy hh:mm"
						date="${newsInstance.dateCreated}" />
                    <hr/>

                    <div>
                        ${raw(newsInstance?.content)} .... | &nbsp;&nbsp;<g:link
                            id="${newsInstance.id}" action="public_show"><strong>Подробнее</strong></g:link>
                    </div>
                </div>
            </fieldset>
        </g:each>
        <div class="paginateButtons">
            <g:paginate total="${newsInstanceTotal}"/>
        </div>
    </fieldset>


</fieldset>
</div>
</body>
</html>
