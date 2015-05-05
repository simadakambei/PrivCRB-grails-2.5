<%@ page import="ru.gbuz.ao.privolgie.vocs.Product" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="product.delete"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="product.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="product.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="product.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="product.title"
                                                          default="Title"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: productInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: productInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="specification"><g:message code="product.specification"
                                                                  default="Specification"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: productInstance, field: 'specification', 'errors')}">
                            <g:textArea name="specification" rows="5" cols="40"
                                        value="${fieldValue(bean: productInstance, field: 'specification')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="manufacturer"><g:message code="product.manufacturer"
                                                                 default="Manufacturer"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: productInstance, field: 'manufacturer', 'errors')}">
                            <g:select name="manufacturer.id" from="${ru.gbuz.ao.privolgie.vocs.Manufacturer.list()}"
                                      optionKey="id" value="${productInstance?.manufacturer?.id}"
                                      noSelection="['null': '']"/>

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
