<%@ page import="ru.gbuz.ao.privolgie.app.site.Article" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="article.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6" style="float: left">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <legend><g:message code="article.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:each in="${Article.findAllByMedical(true).reverse()}" status="i" var="articleInstance">
            <fieldset class="ui-corner-all">
                <div class="value">

                    <h4 class="ui-state-active otstup-left">${fieldValue(bean: articleInstance, field: "title")}</h4>

                    <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${articleInstance.dateCreated}"/>
                    <hr/>
                    ${raw(articleInstance?.title)} .... | &nbsp;&nbsp;<g:link
                        id="${articleInstance.id}" action="public_show"><strong>Подробнее</strong></g:link>
                </div>
            </fieldset>
        </g:each>
        <div class="paginateButtons">
            <g:paginate total="${articleInstanceTotal}"/>
        </div>
    </fieldset>

</div>
</body>
</html>
