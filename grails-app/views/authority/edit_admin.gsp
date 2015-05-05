<%@ page import="ru.gbuz.ao.privolgie.security.Authority" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="authority.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="authority.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="authority.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="authority.choice"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${authority}">
            <div class="errors">
                <g:renderErrors bean="${authority}" as="list"/>
            </div>
        </g:hasErrors> 
        <g:form>
            <div class="dialog">
                <table>
                    <tbody>
                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="authority.authority"
                                                                 default="Title"/>:</td>
                        <td valign="top" class="value">
                            <g:select name="id" from="${Authority.list()}" optionKey="id"
                                      optionValue="authority" noSelection="['null': '-Выбор роли-']"/>
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