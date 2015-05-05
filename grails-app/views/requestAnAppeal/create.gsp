<%@ page import="ru.gbuz.ao.privolgie.app.site.RequestAnAppeal" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="requestAnAppeal.create"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="requestAnAppeal.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="requestAnAppeal.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${requestAnAppealInstance}">
            <div class="errors">
                <g:renderErrors bean="${requestAnAppealInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="requestFIO"><g:message code="requestAnAppeal.requestFIO"
                                                               default="Request FIO"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: requestAnAppealInstance, field: 'requestFIO', 'errors')}">
                            <g:textField name="requestFIO"
                                         value="${fieldValue(bean: requestAnAppealInstance, field: 'requestFIO')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="requestAddres"><g:message code="requestAnAppeal.requestAddres"
                                                                  default="Request Addres"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: requestAnAppealInstance, field: 'requestAddres', 'errors')}">
                            <g:textField name="requestAddres"
                                         value="${fieldValue(bean: requestAnAppealInstance, field: 'requestAddres')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="phone"><g:message code="requestAnAppeal.phone"
                                                          default="Phone"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: requestAnAppealInstance, field: 'phone', 'errors')}">
                            <g:textField name="phone"
                                         value="${fieldValue(bean: requestAnAppealInstance, field: 'phone')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="email"><g:message code="requestAnAppeal.email"
                                                          default="Email"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: requestAnAppealInstance, field: 'email', 'errors')}">
                            <g:textField name="email"
                                         value="${fieldValue(bean: requestAnAppealInstance, field: 'email')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="requestDate"><g:message code="requestAnAppeal.requestDate"
                                                                default="Request Date"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: requestAnAppealInstance, field: 'requestDate', 'errors')}">
                            <g:hiddenField name="requestDate"
                                           value="${requestAnAppealInstance.requestDate = new Date().toTimestamp()}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="officialPost"><g:message code="requestAnAppeal.officialPost"
                                                                 default="Official Post"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: requestAnAppealInstance, field: 'officialPost', 'errors')}">
                            <g:select name="officialPost.id" from="${ru.gbuz.ao.privolgie.vocs.OfficialPost.list()}"
                                      optionKey="id" value="${requestAnAppealInstance?.officialPost?.id}"
                                      noSelection="['null': '-Выбор официального лица портала-']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="requestAnAppeal"><g:message code="requestAnAppeal.requestAnAppeal"
                                                                    default="Request An Appeal"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: requestAnAppealInstance, field: 'requestAnAppeal', 'errors')}">
                            <g:textArea rows="5" cols="30" name="requestAnAppeal"
                                        value="${fieldValue(bean: requestAnAppealInstance, field: 'requestAnAppeal')}"
                                        default="${null}"/>

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
