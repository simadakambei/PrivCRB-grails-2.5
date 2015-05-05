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
        <legend><g:message code="question.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'question.id', default: 'Id')}"/>

                    <g:sortableColumn property="FIO"
                                      title="${message(code: 'question.FIO', default: 'FIO')}"/>

                    <g:sortableColumn property="question"
                                      title="${message(code: 'question.question', default: 'Question')}"/>

                    <g:sortableColumn property="dateQuestion"
                                      title="${message(code: 'question.dateQuestion', default: 'Date Question')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${questionInstanceList}" status="i" var="questionInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: questionInstance, field: "FIO")}</td>

                        <td>${fieldValue(bean: questionInstance, field: "question")}</td>

                        <td><g:formatDate date="${questionInstance.dateQuestion}"/></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${questionInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
