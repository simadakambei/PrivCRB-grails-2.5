<%@ page import="ru.gbuz.ao.privolgie.security.Person" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="person.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="person.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="person.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="person.choice"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${person}">
            <div class="errors">
                <g:renderErrors bean="${person}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form>
            <div class="dialog">
                <table>
                    <tbody>
                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="person.userRealName"/>:</td>
                        <td valign="top" class="value">
                            <g:select name="id" from="${Person.list()}" optionKey="id"
                                      optionValue="fullname" noSelection="['null': '-Выбор пользователя-']"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit action="edit" class="edit"
                                                     value="${message(code: 'default.button.edit.label')}"/></span>
            </div>

        </g:form>
    </fieldset>
</div>
</body>