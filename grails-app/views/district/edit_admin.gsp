<%@ page import="ru.gbuz.ao.privolgie.app.entity.District" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="district.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="district.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="district.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="district.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${districtInstance}">
            <div class="errors">
                <g:renderErrors bean="${districtInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="district.title"
                                                          default="Title"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: districtInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: districtInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="district.definition"
                                                               default="Definition"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: districtInstance, field: 'definition', 'errors')}">
                            <g:textField name="definition"
                                         value="${fieldValue(bean: districtInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="departments"><g:message code="district.departments"
                                                                default="Departments"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: districtInstance, field: 'departments', 'errors')}">

                            <ul>
                                <g:each in="${districtInstance?.departments}" var="departmentInstance">
                                    <li><g:link controller="department" action="show"
                                                id="${departmentInstance.id}">${departmentInstance?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller="department" params="['district.id': districtInstance?.id]"
                                    action="create"><g:message code="department.new" default="New Department"/></g:link>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', 'default': 'Edit')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
