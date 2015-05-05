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
        <span class="menuButton"><g:link class="create" action="create"><g:message code="answer.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="answer.show"/> - ${answerInstance?.question}: <g:formatDate
                format="dd MMMMMMMM yyyy hh:mm" date="${answerInstance?.question?.dateQuestion}"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><strong><g:message code="answer.question"
                                                                     default="Question"/>:</strong>${answerInstance?.question?.question}
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><strong><g:message code="answer.answer"
                                                                     default="Answer"/>:</strong>${fieldValue(bean: answerInstance, field: "answer")}
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><strong><g:message code="answer.answerDate"
                                                                     default="Date Answer"/>:</strong><g:formatDate
                            format="dd MMMMMMMM yyyy hh:mm" date="${answerInstance?.dateAnswer}"/></td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><strong><g:message code="answer.signature"
                                                                     default="Signature"/>:</strong>${fieldValue(bean: answerInstance, field: "signature")}
                    </td>
                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${answerInstance?.id}"/>
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </g:form>
        </div>
    </fieldset>
</div>
</body>
</html>
