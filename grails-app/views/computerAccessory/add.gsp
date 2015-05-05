<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ComputerAccessory" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="computerAccessory.add"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <legend><g:message code="computerAccessory.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${computerAccessoryInstance}">
            <div class="errors">
                <g:renderErrors bean="${computerAccessoryInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="specification"><g:message code="computerAccessory.specification"
                                                                  default="Specification"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: computerAccessoryInstance, field: 'specification', 'errors')}">
                            <g:textArea name="specification" rows="5" cols="40"
                                        value="${fieldValue(bean: computerAccessoryInstance, field: 'specification')}"/>

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
