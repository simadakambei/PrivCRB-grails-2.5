<%@ page import="ru.gbuz.ao.privolgie.app.entity.District" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="district.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="district.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message code="district.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="district.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="district.title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: districtInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="district.definition"
                                                             default="Definition"/></td>

                    <td valign="top" class="value">${fieldValue(bean: districtInstance, field: "definition")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="district.departments"
                                                             default="Departments"/></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${districtInstance.departments}" var="d">
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
                <g:hiddenField name="id" value="${districtInstance?.id}"/>
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
