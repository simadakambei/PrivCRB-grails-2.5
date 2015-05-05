<%@ page import="ru.gbuz.ao.privolgie.app.entity.Department" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="department.create"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="department.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="department.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${departmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${departmentInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="department.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: departmentInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: departmentInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="director"><g:message code="department.director"
                                                             default="Director"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentInstance, field: 'director', 'errors')}">
                            <g:select name="director.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}"
                                      optionKey="id" value="${departmentInstance?.director?.id}"
                                      noSelection="['null': '- Выбор пользователя -']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="addres"><g:message code="department.addres"
                                                           default="Addres"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentInstance, field: 'addres', 'errors')}">
                            <g:textArea name="addres" rows="5" cols="40"
                                        value="${fieldValue(bean: departmentInstance, field: 'addres')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="addres"><g:message code="department.transport"
                                                           default="Transport"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentInstance, field: 'transport', 'errors')}">
                            <g:textArea name="transport" rows="5" cols="40"
                                        value="${fieldValue(bean: departmentInstance, field: 'transport')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="phone"><g:message code="department.phone"
                                                          default="Phone"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: departmentInstance, field: 'phone', 'errors')}">
                            <g:textField name="phone" value="${fieldValue(bean: departmentInstance, field: 'phone')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="email"><g:message code="department.email"
                                                          default="Email"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: departmentInstance, field: 'email', 'errors')}">
                            <g:textField name="email" value="${fieldValue(bean: departmentInstance, field: 'email')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="department.definition"
                                                               default="Definition"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: departmentInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="passportLPU"><g:message code="department.passportLPU"
                                                                default="Passport LPU"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentInstance, field: 'passportLPU', 'errors')}">
                            <g:select name="passportLPU.id" from="${ru.gbuz.ao.privolgie.app.entity.PassportLPU.list()}"
                                      optionKey="id" value="${departmentInstance?.passportLPU?.id}"
                                      noSelection="['null': '- Выбор паспорта ЛПУ -']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="lpu"><g:message code="department.lpu"
                                                        default="Lpu"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: departmentInstance, field: 'lpu', 'errors')}">
                            <g:select name="lpu.id" from="${ru.gbuz.ao.privolgie.app.entity.LPU.list()}" optionKey="id"
                                      value="${departmentInstance?.lpu?.id}"
                                      noSelection="['null': '- Выбор родительского ЛПУ -']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="district"><g:message code="department.district"
                                                             default="District"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentInstance, field: 'district', 'errors')}">
                            <g:select name="district.id" from="${ru.gbuz.ao.privolgie.app.entity.District.list()}"
                                      optionKey="id" value="${departmentInstance?.district?.id}"
                                      noSelection="['null': '- Выбор территориального участка -']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="longitude"><g:message code="department.longitude"
                                                              default="Longitude"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentInstance, field: 'longitude', 'errors')}">
                            <g:textField name="longitude"
                                         value="${fieldValue(bean: departmentInstance, field: 'longitude').double}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="latitude"><g:message code="department.latitude"
                                                             default="Latitude"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: departmentInstance, field: 'latitude', 'errors')}">
                            <g:textField name="latitude"
                                         value="${fieldValue(bean: departmentInstance, field: 'latitude').double}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:submitButton name="create" class="save"
                                                     value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
