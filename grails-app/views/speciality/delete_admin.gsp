<%@ page import="ru.gbuz.ao.privolgie.vocs.Speciality" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="speciality.delete"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="speciality.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="speciality.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="speciality.choice"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${specialityInstance}">
            <div class="errors">
                <g:renderErrors bean="${specialityInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form>
            <div class="dialog">
                <table>
                    <tbody>
                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="speciality.title"/>:</td>
                        <td valign="top" class="value">
                            <g:select name="id" from="${ru.gbuz.ao.privolgie.vocs.Speciality.list()}" optionKey="id"
                                      optionValue="title" noSelection="['null': '-Выбор специальности-']"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit action="delete" class="delete"
                                                     value="${message(code: 'default.button.delete.label')}"/></span>
            </div>

        </g:form>
    </fieldset>

</div>
</body>
</html>
