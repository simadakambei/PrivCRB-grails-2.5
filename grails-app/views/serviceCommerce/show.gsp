<%@ page import="ru.gbuz.ao.privolgie.vocs.ServiceCommerce" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="serviceCommerce.show"/></title>
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
                code="serviceCommerce.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="serviceCommerce.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="serviceCommerce.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: serviceCommerceInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="serviceCommerce.title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: serviceCommerceInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="serviceCommerce.price"
                                                             default="Price"/></td>

                    <td valign="top" class="value">${fieldValue(bean: serviceCommerceInstance, field: "price")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="serviceCommerce.description"
                                                             default="Description"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: serviceCommerceInstance, field: "description")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="serviceCommerce.medcode"
                                                             default="Medcode"/></td>

                    <td valign="top" class="value">${fieldValue(bean: serviceCommerceInstance, field: "medcode")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="serviceCommerce.working"
                                                             default="Working"/></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${serviceCommerceInstance?.working}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="serviceCommerce.onsite"
                                                             default="Onsite"/></td>

                    <td valign="top" class="value"><g:formatBoolean boolean="${serviceCommerceInstance?.onsite}"/></td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${serviceCommerceInstance?.id}"/>
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </g:form>
        </div>
    </fieldset>
</div>
</body>
</html>
