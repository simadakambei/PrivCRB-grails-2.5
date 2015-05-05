<%@ page import="ru.gbuz.ao.privolgie.app.site.AnswerToRequestAnAppeal" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="answerToRequestAnAppeal.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="answerToRequestAnAppeal.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="answerToRequestAnAppeal.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="answerToRequestAnAppeal.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${answerToRequestAnAppealInstance}">
            <div class="errors">
                <g:renderErrors bean="${answerToRequestAnAppealInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form method="post">
            <g:hiddenField name="id" value="${answerToRequestAnAppealInstance?.id}"/>
            <g:hiddenField name="version" value="${answerToRequestAnAppealInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="answerDate"><g:message code="answerToRequestAnAppeal.answerDate"
                                                               default="Answer Date"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: answerToRequestAnAppealInstance, field: 'answerDate', 'errors')}">
                            <g:datePicker name="answerDate" value="${answerToRequestAnAppealInstance?.answerDate}"
                                          noSelection="['': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="requestAnAppeal"><g:message code="answerToRequestAnAppeal.requestAnAppeal"
                                                                    default="Request An Appeal"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: answerToRequestAnAppealInstance, field: 'requestAnAppeal', 'errors')}">
                            <g:select name="requestAnAppeal.id"
                                      from="${ru.gbuz.ao.privolgie.app.site.RequestAnAppeal.list()}" optionKey="id"
                                      value="${answerToRequestAnAppealInstance?.requestAnAppeal?.id}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="officialPost"><g:message code="answerToRequestAnAppeal.officialPost"
                                                                 default="Official Post"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: answerToRequestAnAppealInstance, field: 'officialPost', 'errors')}">
                            <g:select name="officialPost.id" from="${ru.gbuz.ao.privolgie.vocs.OfficialPost.list()}"
                                      optionKey="id" value="${answerToRequestAnAppealInstance?.officialPost?.id}"
                                      noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="answer"><g:message code="answerToRequestAnAppeal.answer"
                                                           default="Answer"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: answerToRequestAnAppealInstance, field: 'answer', 'errors')}">
                            <g:textArea name="answer" rows="5" cols="40"
                                        value="${fieldValue(bean: answerToRequestAnAppealInstance, field: 'answer')}"/>

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
