<%@ page import="ru.gbuz.ao.privolgie.app.entity.LPU" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="LPU.delete"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="LPU.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="LPU.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="LPU.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${LPUInstance}">
            <div class="errors">
                <g:renderErrors bean="${LPUInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="LPU.title"
                                                          default="Title"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: LPUInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: LPUInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="director"><g:message code="LPU.director"
                                                             default="Director"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: LPUInstance, field: 'director', 'errors')}">
                            <g:select name="director.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}"
                                      optionKey="id" value="${LPUInstance?.director?.id}" noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="addres"><g:message code="LPU.addres"
                                                           default="Addres"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: LPUInstance, field: 'addres', 'errors')}">
                            <g:textArea name="addres" rows="5" cols="40"
                                        value="${fieldValue(bean: LPUInstance, field: 'addres')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="phone"><g:message code="LPU.phone"
                                                          default="Phone"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: LPUInstance, field: 'phone', 'errors')}">
                            <g:textField name="phone" value="${fieldValue(bean: LPUInstance, field: 'phone')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="email"><g:message code="LPU.email"
                                                          default="Email"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: LPUInstance, field: 'email', 'errors')}">
                            <g:textField name="email" value="${fieldValue(bean: LPUInstance, field: 'email')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="site"><g:message code="LPU.site"
                                                         default="Site"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: LPUInstance, field: 'site', 'errors')}">
                            <g:textField name="site" value="${fieldValue(bean: LPUInstance, field: 'site')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="LPU.definition"
                                                               default="Definition"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: LPUInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" rows="5" cols="40"
                                        value="${fieldValue(bean: LPUInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="passportLPU"><g:message code="LPU.passportLPU"
                                                                default="Passport LPU"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: LPUInstance, field: 'passportLPU', 'errors')}">
                            <g:select name="passportLPU.id" from="${ru.gbuz.ao.privolgie.app.entity.PassportLPU.list()}"
                                      optionKey="id" value="${LPUInstance?.passportLPU?.id}"
                                      noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="departments"><g:message code="LPU.departments"
                                                                default="Departments"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: LPUInstance, field: 'departments', 'errors')}">
                            <g:select name="departments"
                                      from="${ru.gbuz.ao.privolgie.app.entity.Department.list()}"
                                      size="5" multiple="yes" optionKey="id"
                                      value="${LPUInstance?.departments}"/>

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
