<%@ page import="ru.gbuz.ao.privolgie.app.site.Question" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="question.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="question.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="question.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="question.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${questionInstance}">
            <div class="errors">
                <g:renderErrors bean="${questionInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form method="post">
            <g:hiddenField name="id" value="${questionInstance?.id}"/>
            <g:hiddenField name="version" value="${questionInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="FIO"><g:message code="question.FIO"
                                                        default="FIO"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: questionInstance, field: 'FIO', 'errors')}">
                            <g:textField name="FIO" value="${fieldValue(bean: questionInstance, field: 'FIO')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="question"><g:message code="question.question"
                                                             default="Question"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: questionInstance, field: 'question', 'errors')}">
                            <g:textArea name="question" rows="5" cols="40"
                                        value="${fieldValue(bean: questionInstance, field: 'question')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateQuestion"><g:message code="question.dateQuestion"
                                                                 default="Date Question"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: questionInstance, field: 'dateQuestion', 'errors')}">
                            <g:datePicker name="dateQuestion" value="${questionInstance?.dateQuestion}"
                                          noSelection="['': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="answers"><g:message code="question.answers"
                                                            default="Answers"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: questionInstance, field: 'answers', 'errors')}">

                            <ul>
                                <g:each in="${answers}" var="answerInstance">
                                    <li><g:link controller="answer" action="show"
                                                id="${answerInstance.id}">${answerInstance?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller="answer" params="['question.id': questionInstance?.id]"
                                    action="create"><g:message code="answer.new" default="New Answer"/></g:link>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="save" action="update"
                                                     value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
