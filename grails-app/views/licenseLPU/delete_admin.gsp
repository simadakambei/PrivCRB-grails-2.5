<%@ page import="ru.gbuz.ao.privolgie.app.site.LicenseLPU" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="licenseLPU.delete"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="licenseLPU.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="licenseLPU.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="licenseLPU.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${licenseLPUInstance}">
            <div class="errors">
                <g:renderErrors bean="${licenseLPUInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="licenseLPU.title"
                                                          default="Title"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: licenseLPUInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: licenseLPUInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateBegin"><g:message code="licenseLPU.dateBegin"
                                                              default="Date Begin"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: licenseLPUInstance, field: 'dateBegin', 'errors')}">
                            <g:datePicker name="dateBegin" value="${licenseLPUInstance?.dateBegin}"
                                          noSelection="['': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateEnd"><g:message code="licenseLPU.dateEnd"
                                                            default="Date End"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: licenseLPUInstance, field: 'dateEnd', 'errors')}">
                            <g:datePicker name="dateEnd" value="${licenseLPUInstance?.dateEnd}" noSelection="['': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="licenseLPU.definition"
                                                               default="Definition"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: licenseLPUInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: licenseLPUInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="imageExtension"><g:message code="licenseLPU.imageExtension"
                                                                   default="Image Extension"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: licenseLPUInstance, field: 'imageExtension', 'errors')}">
                            <g:textField name="imageExtension"
                                         value="${fieldValue(bean: licenseLPUInstance, field: 'imageExtension')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="picture"><g:message code="licenseLPU.picture"
                                                            default="Picture"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: licenseLPUInstance, field: 'picture', 'errors')}">

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="image"><g:message code="licenseLPU.image"
                                                          default="Image"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: licenseLPUInstance, field: 'image', 'errors')}">

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
