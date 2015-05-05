<%@ page import="ru.gbuz.ao.privolgie.vocs.WorkPlace" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="workPlace.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="workPlace.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="workPlace.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="workPlace.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${workPlaceInstance}">
            <div class="errors">
                <g:renderErrors bean="${workPlaceInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form>
            <div class="dialog">
                <table>
                    <tbody>
                    <tr class="prop">
                        <td valign="top" class="name"><g:message code="workPlace.title"
                                                                 default="Title"/>:</td>
                        <td valign="top" class="value">
                            <g:select name="id" from="${WorkPlace.list()}" optionKey="id"
                                      optionValue="title" noSelection="['null': '-Выбор рабочего места-']"/>
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
</html>
