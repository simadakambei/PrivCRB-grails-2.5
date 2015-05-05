<%@ page import="ru.gbuz.ao.privolgie.app.site.Answer" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="answer.create"/></title>
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
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="answer.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${answerInstance}">
            <div class="errors">
                <g:renderErrors bean="${answerInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateAnswer"><g:message code="answer.answerDate"
                                                               default="Date Answer"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: answerInstance, field: 'dateAnswer', 'errors')}">
                            <g:datePicker name="dateAnswer" value="${answerInstance?.dateAnswer}"
                                          noSelection="['': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="question"><g:message code="answer.question"
                                                             default="Question"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: answerInstance, field: 'question', 'errors')}">
                            <g:select name="question.id" from="${ru.gbuz.ao.privolgie.app.site.Question.list()}"
                                      optionKey="id" value="${answerInstance?.question?.id}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="answer"><g:message code="answer.answer"
                                                           default="Answer"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: answerInstance, field: 'answer', 'errors')}">
                            <g:textArea title="answer" name="answer" rows="5" cols="10"
                                        value="${fieldValue(bean: answerInstance, field: 'answer')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="signature"><g:message code="answer.signature"
                                                              default="Signature"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: answerInstance, field: 'signature', 'errors')}">
                            <g:textField name="signature"
                                         value="${fieldValue(bean: answerInstance, field: 'signature')}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:submitButton name="create" class="save"
                                                     value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
