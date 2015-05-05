<%@ page import="ru.gbuz.ao.privolgie.app.entity.DepartmentUnit" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="departmentUnit.delete"/></title>
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
                code="departmentUnit.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="departmentUnit.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${departmentUnitInstance}">
            <div class="errors">
                <g:renderErrors bean="${departmentUnitInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="departmentUnit.title"
                                                          default="Title"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentUnitInstance, field: 'title', 'errors')}">
                            <g:textField name="title"
                                         value="${fieldValue(bean: departmentUnitInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="director"><g:message code="departmentUnit.director"
                                                             default="Director"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentUnitInstance, field: 'director', 'errors')}">
                            <g:select name="director.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}"
                                      optionKey="id" value="${departmentUnitInstance?.director?.id}"
                                      noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="addres"><g:message code="departmentUnit.addres"
                                                           default="Addres"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentUnitInstance, field: 'addres', 'errors')}">
                            <g:textArea name="addres" rows="5" cols="40"
                                        value="${fieldValue(bean: departmentUnitInstance, field: 'addres')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="phone"><g:message code="departmentUnit.phone"
                                                          default="Phone"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentUnitInstance, field: 'phone', 'errors')}">
                            <g:textField name="phone"
                                         value="${fieldValue(bean: departmentUnitInstance, field: 'phone')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="email"><g:message code="departmentUnit.email"
                                                          default="Email"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentUnitInstance, field: 'email', 'errors')}">
                            <g:textField name="email"
                                         value="${fieldValue(bean: departmentUnitInstance, field: 'email')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="departmentUnit.definition"
                                                               default="Definition"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentUnitInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: departmentUnitInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="passportLPU"><g:message code="departmentUnit.passportLPU"
                                                                default="Passport LPU"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentUnitInstance, field: 'passportLPU', 'errors')}">
                            <g:select name="passportLPU.id" from="${ru.gbuz.ao.privolgie.app.entity.PassportLPU.list()}"
                                      optionKey="id" value="${departmentUnitInstance?.passportLPU?.id}"
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
