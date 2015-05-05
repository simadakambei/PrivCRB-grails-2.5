<%@ page import="ru.gbuz.ao.privolgie.vocs.Product" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="product.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list">
            <g:message code="product.list"/></g:link>
        </span>
    </div>
    <fieldset class="ui-corner-all">
        <legend>
            <g:message code="product.show"/>
        </legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="product.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: productInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message
                            code="product.title" default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: productInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td colspan="2" valign="top" class="name"><g:message
                            code="product.specification" default="Specification"/></td>
                </tr>
                <tr class="prop">
                    <td colspan="2" valign="top"
                        class="value">${fieldValue(bean: productInstance, field: "specification").decodeHTML()}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message
                            code="product.manufacturer" default="Manufacturer"/></td>

                    <td valign="top" class="value"><g:link
                            controller="manufacturer" action="show"
                            id="${productInstance?.manufacturer?.id}">${productInstance?.manufacturer?.decodeHTML()}</g:link></td>
                </tr>

                </tbody>
            </table>
        </div>

    </fieldset>
</div>
</body>
</html>
