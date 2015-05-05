<%@ page import="ru.gbuz.ao.privolgie.vocs.ServiceCommerce" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="serviceCommerce.delete"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="serviceCommerce.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="serviceCommerce.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="serviceCommerce.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${serviceCommerceInstance}">
            <div class="errors">
                <g:renderErrors bean="${serviceCommerceInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="serviceCommerce.title"
                                                          default="Title"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: serviceCommerceInstance, field: 'title', 'errors')}">
                            <g:textField name="title"
                                         value="${fieldValue(bean: serviceCommerceInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="price"><g:message code="serviceCommerce.price"
                                                          default="Price"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: serviceCommerceInstance, field: 'price', 'errors')}">
                            <g:textField name="price"
                                         value="${fieldValue(bean: serviceCommerceInstance, field: 'price')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="description"><g:message code="serviceCommerce.description"
                                                                default="Description"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: serviceCommerceInstance, field: 'description', 'errors')}">
                            <g:textArea name="description" rows="5" cols="40"
                                        value="${fieldValue(bean: serviceCommerceInstance, field: 'description')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="medcode"><g:message code="serviceCommerce.medcode"
                                                            default="Medcode"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: serviceCommerceInstance, field: 'medcode', 'errors')}">
                            <g:textField name="medcode"
                                         value="${fieldValue(bean: serviceCommerceInstance, field: 'medcode')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="working"><g:message code="serviceCommerce.working"
                                                            default="Working"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: serviceCommerceInstance, field: 'working', 'errors')}">
                            <g:checkBox name="working" value="${serviceCommerceInstance?.working}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="onsite"><g:message code="serviceCommerce.onsite"
                                                           default="Onsite"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: serviceCommerceInstance, field: 'onsite', 'errors')}">
                            <g:checkBox name="onsite" value="${serviceCommerceInstance?.onsite}"/>

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
