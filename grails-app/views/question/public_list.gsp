<%@ page import="ru.gbuz.ao.privolgie.app.site.Question" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="question.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="question.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <br/>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <fieldset class="ui-corner-all">
                <legend>Вопросы в работе</legend>
                <g:each in="${questionNotAnswerList}" status="i" var="questionInstance">
                    <fieldset class="ui-corner-all">
                        <div class="value">
                            <h5 class="ui-state-active otstup-left"><g:link action="public_show"
                                                                            id="${questionInstance?.id}">${fieldValue(bean: questionInstance, field: "FIO")}</g:link></h5>
                            <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${questionInstance.dateQuestion}"/>
                        </div>
                    </fieldset>
                </g:each>
            </fieldset>

            <fieldset class="ui-corner-all">
                <legend>Вопросы, на которые получен ответ</legend>
                <g:each in="${questionAnswerList}" status="i" var="questionInstance">
                    <fieldset class="ui-corner-all">
                        <div class="value">
                            <h5 class="ui-state-active otstup-left"><g:link action="public_show"
                                                                            id="${questionInstance?.id}">${fieldValue(bean: questionInstance, field: "FIO")}</g:link></h5>
                            <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${questionInstance?.dateQuestion}"/>
                        </div>
                    </fieldset>
                </g:each>
            </fieldset>

        </div>

        <div class="paginateButtons">
            <g:paginate total="${questionInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
