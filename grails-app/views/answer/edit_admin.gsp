<%@ page import="ru.gbuz.ao.privolgie.app.site.Answer" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="answer.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="answer.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="answer.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="answer.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${answerInstance}">
            <div class="errors">
                <g:renderErrors bean="${answerInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateAnswer"><g:message code="answer.dateAnswer"
                                                               default="Date Answer"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: answerInstance, field: 'dateAnswer', 'errors')}">
                            <g:datePicker name="dateAnswer" value="${answerInstance?.dateAnswer}"
                                          noSelection="['': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="answer"><g:message code="answer.answer"
                                                           default="Answer"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: answerInstance, field: 'answer', 'errors')}">
                            <g:textField name="answer" value="${fieldValue(bean: answerInstance, field: 'answer')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="question"><g:message code="answer.question"
                                                             default="Question"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: answerInstance, field: 'question', 'errors')}">
                            <g:select name="question.id" from="${ru.gbuz.ao.privolgie.app.site.Question.list()}"
                                      optionKey="id" value="${answerInstance?.question?.id}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="signature"><g:message code="answer.signature"
                                                              default="Signature"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: answerInstance, field: 'signature', 'errors')}">
                            <g:textField name="signature"
                                         value="${fieldValue(bean: answerInstance, field: 'signature')}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', 'default': 'Edit')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
