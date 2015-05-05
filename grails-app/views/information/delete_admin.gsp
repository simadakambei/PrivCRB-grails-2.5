<%@ page import="ru.gbuz.ao.privolgie.app.site.Information" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="information.delete"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="information.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="information.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="information.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${informationInstance}">
            <div class="errors">
                <g:renderErrors bean="${informationInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="information.title"
                                                          default="Title"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: informationInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: informationInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateinfo"><g:message code="information.dateinfo"
                                                             default="Dateinfo"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: informationInstance, field: 'dateinfo', 'errors')}">
                            <g:datePicker name="dateinfo" value="${informationInstance?.dateinfo}"
                                          noSelection="['': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="content"><g:message code="information.content"
                                                            default="Content"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: informationInstance, field: 'content', 'errors')}">
                            <g:textArea name="content" rows="5" cols="40"
                                        value="${fieldValue(bean: informationInstance, field: 'content')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="visible"><g:message code="information.visible"
                                                            default="Visible"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: informationInstance, field: 'visible', 'errors')}">
                            <g:checkBox name="visible" value="${informationInstance?.visible}"/>

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
