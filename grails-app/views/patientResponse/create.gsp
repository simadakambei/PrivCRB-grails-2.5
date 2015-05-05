<%@ page import="ru.gbuz.ao.privolgie.app.site.PatientResponse" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="patientResponse.create"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="public_list"><g:message
                code="patientResponse.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="patientResponse.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${patientResponseInstance}">
            <div class="errors">
                <g:renderErrors bean="${patientResponseInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="patientFIO"><g:message code="patientResponse.patientFIO"
                                                               default="Patient FIO"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientResponseInstance, field: 'patientFIO', 'errors')}">
                            <g:textField name="patientFIO"
                                         value="${fieldValue(bean: patientResponseInstance, field: 'patientFIO')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="addres"><g:message code="patientResponse.addres"
                                                           default="Addres"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientResponseInstance, field: 'addres', 'errors')}">
                            <g:textArea cols="40" rows="3" name="addres"
                                        value="${fieldValue(bean: patientResponseInstance, field: 'addres')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateResponse"><g:message code="patientResponse.dateResponse"
                                                                 default="Date Response"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientResponseInstance, field: 'dateResponse', 'errors')}">
                            <g:datePicker locale="ru" format="dd.MM.yyyy" name="dateResponse"
                                          value="${patientResponseInstance?.dateResponse}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="response"><g:message code="patientResponse.response"
                                                             default="Response"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientResponseInstance, field: 'response', 'errors')}">
                            <g:textArea cols="40" rows="5" name="response"
                                        value="${fieldValue(bean: patientResponseInstance, field: 'response')}"/>

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
