<%@ page import="ru.gbuz.ao.privolgie.vocs.ComputerAccessoryType" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="computerAccessoryType.delete"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="computerAccessoryType.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="computerAccessoryType.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="computerAccessoryType.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${computerAccessoryTypeInstance}">
            <div class="errors">
                <g:renderErrors bean="${computerAccessoryTypeInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="computerAccessoryType.title"
                                                          default="Title"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: computerAccessoryTypeInstance, field: 'title', 'errors')}">
                            <g:textField name="title"
                                         value="${fieldValue(bean: computerAccessoryTypeInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="eng_title"><g:message code="computerAccessoryType.eng_title"
                                                              default="Engtitle"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: computerAccessoryTypeInstance, field: 'eng_title', 'errors')}">
                            <g:textField name="eng_title"
                                         value="${fieldValue(bean: computerAccessoryTypeInstance, field: 'eng_title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="computerAccessoryType.definition"
                                                               default="Definition"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: computerAccessoryTypeInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: computerAccessoryTypeInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', 'default': 'Delete')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
