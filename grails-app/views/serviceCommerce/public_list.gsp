<%@ page import="ru.gbuz.ao.privolgie.vocs.ServiceCommerce" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="serviceCommerce.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumedicalservize"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <legend><g:message code="serviceCommerce.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <blockquote>
                Платные медицинские услуги, предоставляемые ГБУЗ АО 'Приволжская ЦРБ' оказываются
                в соответствии с Правилами предоставления платных медицинских услуг населению медицинскими учреждениями
                (утв. постановлением Правительства РФ от 13 января 1996 г. N 27)
            </blockquote>
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'serviceCommerce.title', default: 'Title')}"/>

                    <g:sortableColumn property="price"
                                      title="${message(code: 'serviceCommerce.price', default: 'Price')}"/>

                    <g:sortableColumn property="description"
                                      title="${message(code: 'serviceCommerce.description', default: 'Description')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${serviceCommerceInstanceList}" status="i" var="serviceCommerceInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${serviceCommerceInstance.id}">${fieldValue(bean: serviceCommerceInstance, field: "title")}</g:link></td>

                        <td>${fieldValue(bean: serviceCommerceInstance, field: "price")}</td>

                        <td>${fieldValue(bean: serviceCommerceInstance, field: "description")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${serviceCommerceInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
