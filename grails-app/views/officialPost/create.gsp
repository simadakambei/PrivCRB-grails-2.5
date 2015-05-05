<%@ page import="ru.gbuz.ao.privolgie.vocs.OfficialPost" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="officialPost.create"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="officialPost.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="officialPost.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${officialPostInstance}">
            <div class="errors">
                <g:renderErrors bean="${officialPostInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td colspan="2" valign="top" class="name">
                            <label for="title"><g:message code="officialPost.title"
                                                          default="Title"/></label>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td colspan="2" valign="top"
                            class="value ${hasErrors(bean: officialPostInstance, field: 'title', 'errors')}">
                            <g:textField size="40" name="title"
                                         value="${fieldValue(bean: officialPostInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td colspan="2" valign="top" class="name">
                            <label for="person"><g:message code="officialPost.person"
                                                           default="Person"/></label>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td colspan="2" valign="top"
                            class="value ${hasErrors(bean: officialPostInstance, field: 'person', 'errors')}">
                            <g:select name="person.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}"
                                      optionKey="id" value="${officialPostInstance?.person?.id}"
                                      noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td colspan="2" valign="top" class="name">
                            <label for="definition"><g:message code="officialPost.definition"
                                                               default="Definition"/></label>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td colspan="2" valign="top"
                            class="value ${hasErrors(bean: officialPostInstance, field: 'definition', 'errors')}">
                            <g:textArea rows="5" cols="30" name="definition"
                                        value="${fieldValue(bean: officialPostInstance, field: 'definition')}"/>

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
