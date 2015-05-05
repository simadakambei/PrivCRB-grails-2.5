<%@ page import="ru.gbuz.ao.privolgie.app.site.AnswerToRequestAnAppeal" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="answerToRequestAnAppeal.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="answerToRequestAnAppeal.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="answerToRequestAnAppeal.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'answerToRequestAnAppeal.id', default: 'Id')}"/>

                    <g:sortableColumn property="answerDate"
                                      title="${message(code: 'answerToRequestAnAppeal.answerDate', default: 'Answer Date')}"/>

                    <th><g:message code="answerToRequestAnAppeal.requestAnAppeal"
                                   default="Request An Appeal"/></th>

                    <th><g:message code="answerToRequestAnAppeal.officialPost"
                                   default="Official Post"/></th>

                    <g:sortableColumn property="answer"
                                      title="${message(code: 'answerToRequestAnAppeal.answer', default: 'Answer')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${answerToRequestAnAppealInstanceList}" status="i" var="answerToRequestAnAppealInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${answerToRequestAnAppealInstance.id}">${fieldValue(bean: answerToRequestAnAppealInstance, field: "id")}</g:link></td>

                        <td><g:formatDate date="${answerToRequestAnAppealInstance.answerDate}"/></td>

                        <td>${fieldValue(bean: answerToRequestAnAppealInstance, field: "requestAnAppeal")}</td>

                        <td>${fieldValue(bean: answerToRequestAnAppealInstance, field: "officialPost")}</td>

                        <td>${fieldValue(bean: answerToRequestAnAppealInstance, field: "answer")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${answerToRequestAnAppealInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
