<%@ page import="ru.gbuz.ao.privolgie.vocs.PatientInformationType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="patientInformationType.show"/></title>
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
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="patientInformationType.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="patientInformationType.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: patientInformationTypeInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="patientInformationType.name"
                                                             default="Name"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: patientInformationTypeInstance, field: "name")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="patientInformationType.code"
                                                             default="Code"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: patientInformationTypeInstance, field: "code")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="patientInformationType.definition"
                                                             default="Definition"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: patientInformationTypeInstance, field: "definition")}</td>

                </tr>

                </tbody>
            </table>
        </div>
    </fieldset>
</div>
</body>
</html>
