<%@ page import="ru.gbuz.ao.privolgie.vocs.OfficialPost" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="officialPost.show"/></title>
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
        <legend><g:message code="officialPost.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="officialPost.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: officialPostInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="officialPost.title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: officialPostInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="officialPost.person"
                                                             default="Person"/></td>

                    <td valign="top" class="value"><g:link controller="person"
                                                           action="show"
                                                           id="${officialPostInstance?.person?.id}">${officialPostInstance?.person?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="officialPost.definition"
                                                             default="Definition"/></td>

                    <td valign="top" class="value">${fieldValue(bean: officialPostInstance, field: "definition")}</td>

                </tr>

                </tbody>
            </table>
        </div>
    </fieldset>
</div>
</body>
</html>
