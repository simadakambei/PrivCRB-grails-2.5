<%@ page import="ru.gbuz.ao.privolgie.app.site.Question" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="question.show"/></title>
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
                <h4 class="ui-state-active otstup-left">${fieldValue(bean: questionInstance, field: "FIO")}</h4>
                <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${questionInstance?.dateQuestion}"/><br/>
                <hr/>
                <fieldset class="odd">
                    <legend>Вопрос</legend>
                    ${raw(questionInstance?.question)}
                </fieldset>

                <br/>
                <g:if test="${!answers.empty}">
                    <g:each in="${answers}" var="answer">
                        <fieldset class="odd">
                            <legend>Ответ</legend>
                            ${raw(answer?.answer)}
                            <blockquote>
                                <g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                                              date="${answer?.dateAnswer}"/> - ${answer?.signature}
                            </blockquote>
                        </fieldset>
                    </g:each>
                </g:if>
                <g:else>
                    <g:message code="answer.notAnswer"/>
                </g:else>
            </div>
        </fieldset>
    </fieldset>
</div>
</body>
</html>
