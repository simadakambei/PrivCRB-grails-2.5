<%@ page import="ru.gbuz.ao.privolgie.app.site.AnswerToRequestAnAppeal" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="answerToRequestAnAppeal.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>


    <fieldset class="ui-corner-all">
        <legend><g:message code="answerToRequestAnAppeal.show"/>: <g:link controller="requestAnAppeal"
                                                                          action="public_show"
                                                                          id="${answerToRequestAnAppealInstance?.requestAnAppeal?.id}">${answerToRequestAnAppealInstance?.requestAnAppeal}</g:link> от <g:formatDate
                format="dd MMMMMMMM yyyy hh:mm"
                date="${answerToRequestAnAppealInstance?.requestAnAppeal?.requestDate}"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="breadCrumbHolder module">
            <div id="breadCrumb" class="breadCrumb module"></div>
        </div>
        <fieldset class="ui-corner-all">
            <fieldset class="odd">
                ${raw(answerToRequestAnAppealInstance?.answer)}
            </fieldset>
            <blockquote>
                <g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                              date="${answerToRequestAnAppealInstance?.answerDate}"/> - ${answerToRequestAnAppealInstance?.officialPost}
            </blockquote>
        </fieldset>
    </fieldset>
</div>
</body>
</html>
