<%@ page import="ru.gbuz.ao.privolgie.vocs.Product" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="product.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="product.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="product.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'product.title', default: 'Title')}"/>

                    <g:sortableColumn property="specification"
                                      title="${message(code: 'product.specification', default: 'Specification')}"/>

                    <th><g:message code="product.manufacturer"
                                   default="Manufacturer"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${productInstanceList}" status="i" var="productInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${productInstance.id}">${fieldValue(bean: productInstance, field: "title")}</g:link></td>

                        <td>${fieldValue(bean: productInstance, field: "specification").decodeHTML()}</td>

                        <td>${fieldValue(bean: productInstance, field: "manufacturer")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${productInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
