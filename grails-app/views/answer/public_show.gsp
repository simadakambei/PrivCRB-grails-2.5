<%@ page import="ru.gbuz.ao.privolgie.app.site.Answer" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="answer.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="answer.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="answer.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="answer.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: answerInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="answer.dateAnswer"
                                                             default="Date Answer"/></td>

                    <td valign="top" class="value"><g:formatDate date="${answerInstance?.dateAnswer}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="answer.answer"
                                                             default="Answer"/></td>

                    <td valign="top" class="value">${fieldValue(bean: answerInstance, field: "answer")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="answer.question"
                                                             default="Question"/></td>

                    <td valign="top" class="value"><g:link controller="question"
                                                           action="show"
                                                           id="${answerInstance?.question?.id}">${answerInstance?.question?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="answer.signature"
                                                             default="Signature"/></td>

                    <td valign="top" class="value">${fieldValue(bean: answerInstance, field: "signature")}</td>

                </tr>

                </tbody>
            </table>
        </div>
    </fieldset>
</div>
</body>
</html>
