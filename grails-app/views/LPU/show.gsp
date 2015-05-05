<%@ page import="ru.gbuz.ao.privolgie.app.entity.LPU" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="LPU.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="LPU.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message code="LPU.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend class="lpu"><g:message code="LPU.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="LPU.title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: LPUInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="LPU.full_title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: LPUInstance, field: "full_title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="LPU.director"
                                                             default="Director"/></td>

                    <td valign="top" class="value"><g:link controller="person"
                                                           action="show"
                                                           id="${LPUInstance?.director?.id}">${LPUInstance?.director}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="LPU.addres"
                                                             default="Addres"/></td>

                    <td valign="top" class="value">${fieldValue(bean: LPUInstance, field: "addres")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="LPU.phone"
                                                             default="Phone"/></td>

                    <td valign="top" class="value">${fieldValue(bean: LPUInstance, field: "phone")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="LPU.email"
                                                             default="Email"/></td>

                    <td valign="top" class="value">${fieldValue(bean: LPUInstance, field: "email")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="LPU.site"
                                                             default="Site"/></td>

                    <td valign="top" class="value">${fieldValue(bean: LPUInstance, field: "site")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="LPU.longitude"
                                                             default="Longitude"/></td>

                    <td valign="top" class="value">${fieldValue(bean: LPUInstance, field: "longitude").toString()}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="LPU.latitude"
                                                             default="Latitude"/></td>

                    <td valign="top" class="value">${fieldValue(bean: LPUInstance, field: "latitude")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="LPU.definition"
                                                             default="Definition"/></td>

                    <td valign="top" class="value">${fieldValue(bean: LPUInstance, field: "definition")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="LPU.passportLPU"
                                                             default="Passport LPU"/></td>

                    <td valign="top" class="value"><g:link controller="passportLPU"
                                                           action="show"
                                                           id="${LPUInstance?.passportLPU?.id}">${LPUInstance?.passportLPU?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="LPU.departments"
                                                             default="Departments"/></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${LPUInstance.departments}" var="d">
                                <li><g:link controller="department" action="show"
                                            id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${LPUInstance?.id}"/>
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
