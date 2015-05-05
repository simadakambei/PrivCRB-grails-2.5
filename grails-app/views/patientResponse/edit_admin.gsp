<%@ page import="ru.gbuz.ao.privolgie.app.site.PatientResponse" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="patientResponse.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="patientResponse.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="patientResponse.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="patientResponse.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${patientResponseInstance}">
            <div class="errors">
                <g:renderErrors bean="${patientResponseInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="patientFIO"><g:message code="patientResponse.patientFIO"
                                                               default="Patient FIO"/>:</label>
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
                                                           default="Addres"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientResponseInstance, field: 'addres', 'errors')}">
                            <g:textField name="addres"
                                         value="${fieldValue(bean: patientResponseInstance, field: 'addres')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateResponse"><g:message code="patientResponse.dateResponse"
                                                                 default="Date Response"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientResponseInstance, field: 'dateResponse', 'errors')}">
                            <g:datePicker name="dateResponse" value="${patientResponseInstance?.dateResponse}"
                                          noSelection="['': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="response"><g:message code="patientResponse.response"
                                                             default="Response"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientResponseInstance, field: 'response', 'errors')}">
                            <g:textField name="response"
                                         value="${fieldValue(bean: patientResponseInstance, field: 'response')}"/>

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