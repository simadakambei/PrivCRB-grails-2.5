<%@ page import="ru.gbuz.ao.privolgie.app.site.PatientInformation" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="patientInformation.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menupatientinformation"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="patientInformation.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="patientInformation.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="patientInformation.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${patientInformationInstance}">
            <div class="errors">
                <g:renderErrors bean="${patientInformationInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <g:hiddenField name="id" value="${patientInformationInstance?.id}"/>
            <g:hiddenField name="version" value="${patientInformationInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="patientInformation.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientInformationInstance, field: 'title', 'errors')}">
                            <g:textField name="title"
                                         value="${fieldValue(bean: patientInformationInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateinfo"><g:message code="patientInformation.dateinfo"
                                                             default="Dateinfo"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientInformationInstance, field: 'dateinfo', 'errors')}">
                            <g:datePicker name="dateinfo" value="${patientInformationInstance?.dateinfo}"
                                          noSelection="['': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="content"><g:message code="patientInformation.content"
                                                            default="Content"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientInformationInstance, field: 'content', 'errors')}">
                            <g:textArea name="content" rows="5" cols="40"
                                        value="${fieldValue(bean: patientInformationInstance, field: 'content')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="visible"><g:message code="patientInformation.visible"
                                                            default="Visible"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientInformationInstance, field: 'visible', 'errors')}">
                            <g:checkBox name="visible" value="${patientInformationInstance?.visible}"/>

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
