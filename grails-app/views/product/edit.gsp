<%@ page import="ru.gbuz.ao.privolgie.vocs.Product" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="product.edit"/></title>
    <ckeditor:resources/>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list">
            <g:message code="product.list"/>
        </g:link></span> <span class="menuButton"><g:link class="create"
                                                          action="create">
        <g:message code="product.create"/>
    </g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend>
            <g:message code="product.edit"/>
        </legend>

        <g:if test="${flash.message}">
            <div class="message">
                ${flash.message}
            </div>
        </g:if>
        <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <g:hiddenField name="id" value="${productInstance?.id}"/>
            <g:hiddenField name="version" value="${productInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name"><label for="title"><g:message
                                code="product.title" default="Title"/></label></td>
                        <td valign="top"
                            class="value ${hasErrors(bean: productInstance, field: 'title', 'errors')}">
                            <g:textField name="title"
                                         value="${fieldValue(bean: productInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td colspan="2" valign="top" class="name"><label
                                for="specification"><g:message
                                    code="product.specification" default="Specification"/></label></td>
                    </tr>
                    <tr class="prop">
                        <td colspan="2" valign="top"
                            class="value ${hasErrors(bean: productInstance, field: 'specification', 'errors')}">
                            <ckeditor:editor name="specification">
                                ${fieldValue(bean: productInstance, field: 'specification').decodeHTML()}
                            </ckeditor:editor>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name"><label for="manufacturer"><g:message
                                code="product.manufacturer" default="Manufacturer"/></label></td>
                        <td valign="top"
                            class="value ${hasErrors(bean: productInstance, field: 'manufacturer', 'errors')}">
                            <g:select name="manufacturer.id"
                                      from="${ru.gbuz.ao.privolgie.vocs.Manufacturer.list()}"
                                      optionKey="id" value="${productInstance?.manufacturer?.id}"
                                      noSelection="['null': '- Выбор производителя -']"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="save"
                                                     action="update"
                                                     value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
                <span class="button"><g:actionSubmit class="delete"
                                                     action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
