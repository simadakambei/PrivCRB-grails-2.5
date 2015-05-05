<%@ page import="ru.gbuz.ao.privolgie.vocs.Manufacturer" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="manufacturer.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="manufacturer.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="manufacturer.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="manufacturer.edit"/></legend>

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${manufacturerInstance}">
            <div class="errors">
                <g:renderErrors bean="${manufacturerInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <g:hiddenField name="id" value="${manufacturerInstance?.id}"/>
            <g:hiddenField name="version" value="${manufacturerInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="manufacturer.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: manufacturerInstance, field: 'title', 'errors')}">
                            <g:textField name="title"
                                         value="${fieldValue(bean: manufacturerInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="description"><g:message code="manufacturer.description"
                                                                default="Description"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: manufacturerInstance, field: 'description', 'errors')}">
                            <g:textArea name="description" rows="5" cols="40"
                                        value="${fieldValue(bean: manufacturerInstance, field: 'description')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="products"><g:message code="manufacturer.products"
                                                             default="Products"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: manufacturerInstance, field: 'products', 'errors')}">

                            <ul>
                                <g:each in="${manufacturerInstance?.products}" var="productInstance">
                                    <li><g:link controller="product" action="show"
                                                id="${productInstance.id}">${productInstance?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller="product" params="['manufacturer.id': manufacturerInstance?.id]"
                                    action="create"><g:message code="product.new" default="New Product"/></g:link>

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
