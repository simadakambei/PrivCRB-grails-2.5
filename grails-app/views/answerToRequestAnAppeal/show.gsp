<%@ page import="ru.gbuz.ao.privolgie.app.site.AnswerToRequestAnAppeal" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="answerToRequestAnAppeal.show"/></title>
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
                code="answerToRequestAnAppeal.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="answerToRequestAnAppeal.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="answerToRequestAnAppeal.id"
                                                             default="Id"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: answerToRequestAnAppealInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="answerToRequestAnAppeal.answerDate"
                                                             default="Answer Date"/></td>

                    <td valign="top" class="value"><g:formatDate
                            date="${answerToRequestAnAppealInstance?.answerDate}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="answerToRequestAnAppeal.requestAnAppeal"
                                                             default="Request An Appeal"/></td>

                    <td valign="top" class="value"><g:link controller="requestAnAppeal"
                                                           action="show"
                                                           id="${answerToRequestAnAppealInstance?.requestAnAppeal?.id}">${answerToRequestAnAppealInstance?.requestAnAppeal?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="answerToRequestAnAppeal.officialPost"
                                                             default="Official Post"/></td>

                    <td valign="top" class="value"><g:link controller="officialPost"
                                                           action="show"
                                                           id="${answerToRequestAnAppealInstance?.officialPost?.id}">${answerToRequestAnAppealInstance?.officialPost?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="answerToRequestAnAppeal.answer"
                                                             default="Answer"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: answerToRequestAnAppealInstance, field: "answer")}</td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${answerToRequestAnAppealInstance?.id}"/>
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
