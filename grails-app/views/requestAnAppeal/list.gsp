<%@ page import="ru.gbuz.ao.privolgie.app.site.RequestAnAppeal" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="requestAnAppeal.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="requestAnAppeal.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="requestAnAppeal.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="requestFIO"
                                      title="${message(code: 'requestAnAppeal.requestFIO', default: 'Request FIO')}"/>

                    <g:sortableColumn property="requestAddres"
                                      title="${message(code: 'requestAnAppeal.requestAddres', default: 'Request Addres')}"/>

                    <g:sortableColumn property="phone"
                                      title="${message(code: 'requestAnAppeal.phone', default: 'Phone')}"/>

                    <g:sortableColumn property="email"
                                      title="${message(code: 'requestAnAppeal.email', default: 'Email')}"/>

                    <g:sortableColumn property="requestDate"
                                      title="${message(code: 'requestAnAppeal.requestDate', default: 'Request Date')}"/>

                    <g:sortableColumn property="answerId"
                                      title="${message(code: 'requestAnAppeal.answer', default: 'Answer')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${requestAnAppealInstanceList}" status="i" var="requestAnAppealInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${requestAnAppealInstance.id}">${fieldValue(bean: requestAnAppealInstance, field: "requestFIO")}</g:link></td>

                        <td>${fieldValue(bean: requestAnAppealInstance, field: "requestAddres")}</td>

                        <td>${fieldValue(bean: requestAnAppealInstance, field: "phone")}</td>

                        <td>${fieldValue(bean: requestAnAppealInstance, field: "email")}</td>

                        <td><g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                                          date="${requestAnAppealInstance.requestDate}"/></td>

                        <td><g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                                          date="${requestAnAppealInstance?.answer?.answerDate}"/></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${requestAnAppealInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
