<%@ page import="ru.gbuz.ao.privolgie.vocs.PatientInformationType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="patientInformationType.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="patientInformationType.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="patientInformationType.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="patientInformationType.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${patientInformationTypeInstance}">
            <div class="errors">
                <g:renderErrors bean="${patientInformationTypeInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <g:hiddenField name="id" value="${patientInformationTypeInstance?.id}"/>
            <g:hiddenField name="version" value="${patientInformationTypeInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name"><g:message code="patientInformationType.name"
                                                         default="Name"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientInformationTypeInstance, field: 'name', 'errors')}">
                            <g:textField name="name"
                                         value="${fieldValue(bean: patientInformationTypeInstance, field: 'name')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="code"><g:message code="patientInformationType.code"
                                                         default="Code"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientInformationTypeInstance, field: 'code', 'errors')}">
                            <g:textField name="code"
                                         value="${fieldValue(bean: patientInformationTypeInstance, field: 'code')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="patientInformationType.definition"
                                                               default="Definition"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: patientInformationTypeInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: patientInformationTypeInstance, field: 'definition')}"/>

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
