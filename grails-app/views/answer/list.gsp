<%@ page import="ru.gbuz.ao.privolgie.app.site.Answer" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="answer.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="answer.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="answer.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'answer.id', default: 'Id')}"/>

                    <g:sortableColumn property="dateAnswer"
                                      title="${message(code: 'answer.dateAnswer', default: 'Date Answer')}"/>

                    <g:sortableColumn property="answer"
                                      title="${message(code: 'answer.answer', default: 'Answer')}"/>

                    <th><g:message code="answer.question"
                                   default="Question"/></th>

                    <g:sortableColumn property="signature"
                                      title="${message(code: 'answer.signature', default: 'Signature')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${answerInstanceList}" status="i" var="answerInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${answerInstance.id}">${fieldValue(bean: answerInstance, field: "id")}</g:link></td>

                        <td><g:formatDate date="${answerInstance.dateAnswer}"/></td>

                        <td>${fieldValue(bean: answerInstance, field: "answer")}</td>

                        <td>${fieldValue(bean: answerInstance, field: "question")}</td>

                        <td>${fieldValue(bean: answerInstance, field: "signature")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${answerInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
