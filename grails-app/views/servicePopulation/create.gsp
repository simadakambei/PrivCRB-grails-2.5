<%@ page import="ru.gbuz.ao.privolgie.vocs.ServicePopulation" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="servicePopulation.create"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="servicePopulation.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="servicePopulation.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${servicePopulationInstance}">
            <div class="errors">
                <g:renderErrors bean="${servicePopulationInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="servicePopulation.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: servicePopulationInstance, field: 'title', 'errors')}">
                            <g:textField name="title"
                                         value="${fieldValue(bean: servicePopulationInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="description"><g:message code="servicePopulation.description"
                                                                default="Description"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: servicePopulationInstance, field: 'description', 'errors')}">
                            <g:textArea name="description" rows="5" cols="40"
                                        value="${fieldValue(bean: servicePopulationInstance, field: 'description')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="medcode"><g:message code="servicePopulation.medcode"
                                                            default="Medcode"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: servicePopulationInstance, field: 'medcode', 'errors')}">
                            <g:textField name="medcode"
                                         value="${fieldValue(bean: servicePopulationInstance, field: 'medcode')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="working"><g:message code="servicePopulation.working"
                                                            default="Working"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: servicePopulationInstance, field: 'working', 'errors')}">
                            <g:checkBox name="working" value="${servicePopulationInstance?.working}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="onsite"><g:message code="servicePopulation.onsite"
                                                           default="Onsite"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: servicePopulationInstance, field: 'onsite', 'errors')}">
                            <g:checkBox name="onsite" value="${servicePopulationInstance?.onsite}"/>

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
