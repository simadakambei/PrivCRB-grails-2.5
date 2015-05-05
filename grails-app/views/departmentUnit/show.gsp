<%@ page import="ru.gbuz.ao.privolgie.app.entity.DepartmentUnit" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="departmentUnit.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="departmentUnit.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="departmentUnit.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="departmentUnit.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="departmentUnit.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: departmentUnitInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="departmentUnit.title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: departmentUnitInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="departmentUnit.director"
                                                             default="Director"/></td>

                    <td valign="top" class="value"><g:link controller="person"
                                                           action="show"
                                                           id="${departmentUnitInstance?.director?.id}">${departmentUnitInstance?.director?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="departmentUnit.addres"
                                                             default="Addres"/></td>

                    <td valign="top" class="value">${fieldValue(bean: departmentUnitInstance, field: "addres")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="departmentUnit.phone"
                                                             default="Phone"/></td>

                    <td valign="top" class="value">${fieldValue(bean: departmentUnitInstance, field: "phone")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="departmentUnit.email"
                                                             default="Email"/></td>

                    <td valign="top" class="value">${fieldValue(bean: departmentUnitInstance, field: "email")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="departmentUnit.definition"
                                                             default="Definition"/></td>

                    <td valign="top" class="value">${fieldValue(bean: departmentUnitInstance, field: "definition")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="departmentUnit.passportLPU"
                                                             default="Passport LPU"/></td>

                    <td valign="top" class="value"><g:link controller="passportLPU"
                                                           action="show"
                                                           id="${departmentUnitInstance?.passportLPU?.id}">${departmentUnitInstance?.passportLPU?.encodeAsHTML()}</g:link></td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${departmentUnitInstance?.id}"/>
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
