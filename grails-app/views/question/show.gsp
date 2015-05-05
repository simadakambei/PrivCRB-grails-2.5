<%@ page import="ru.gbuz.ao.privolgie.app.site.Question" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="question.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="question.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message code="question.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="question.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="question.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: questionInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="question.FIO"
                                                             default="FIO"/></td>

                    <td valign="top" class="value">${fieldValue(bean: questionInstance, field: "FIO")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="question.question"
                                                             default="Question"/></td>

                    <td valign="top" class="value">${fieldValue(bean: questionInstance, field: "question")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="question.dateQuestion"
                                                             default="Date Question"/></td>

                    <td valign="top" class="value"><g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                                                                 date="${questionInstance?.dateQuestion}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="question.answers"
                                                             default="Answers"/></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${answers}" var="answer">
                                <li><g:link controller="answer" action="show"
                                            id="${answer.id}"><g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                                                                            date="${answer?.dateAnswer}"/>: ${answer?.signature}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${questionInstance?.id}"/>
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
