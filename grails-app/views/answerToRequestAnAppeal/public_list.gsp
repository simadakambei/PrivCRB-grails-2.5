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
    <g:isLoggedIn>
        <div>
            <span class="menuButton"><g:link class="create" action="create"><g:message
                    code="answerToRequestAnAppeal.create"/></g:link></span>
        </div>
    </g:isLoggedIn>

    <fieldset class="ui-corner-all">
        <legend><g:message code="answerToRequestAnAppeal.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="answerDate"
                                      title="${message(code: 'answerToRequestAnAppeal.answerDate', default: 'Answer Date')}"/>

                    <th><g:message code="answerToRequestAnAppeal.requestFIO"
                                   default="Request An Appeal"/></th>

                    <th><g:message code="requestAnAppeal.answered"
                                   default="Official Post"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${answerToRequestAnAppealInstanceList}" status="i" var="answerToRequestAnAppealInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="public_show"
                                    id="${answerToRequestAnAppealInstance.id}"><g:formatDate
                                    format="dd MMMMMMMM yyyy hh:mm"
                                    date="${answerToRequestAnAppealInstance.answerDate}"/></g:link></td>


                        <td>${fieldValue(bean: answerToRequestAnAppealInstance, field: "requestAnAppeal")}</td>

                        <td>${fieldValue(bean: answerToRequestAnAppealInstance, field: "officialPost")}</td>
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
