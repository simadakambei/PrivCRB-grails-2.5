<%@ page import="ru.gbuz.ao.privolgie.vocs.Speciality" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="speciality.create"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="speciality.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="speciality.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${specialityInstance}">
            <div class="errors">
                <g:renderErrors bean="${specialityInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="speciality.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: specialityInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: specialityInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="description"><g:message code="speciality.description"
                                                                default="Description"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: specialityInstance, field: 'description', 'errors')}">
                            <g:textArea name="description" rows="5" cols="40"
                                        value="${fieldValue(bean: specialityInstance, field: 'description')}"/>

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
