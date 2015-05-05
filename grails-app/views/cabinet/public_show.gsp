<%@ page import="ru.gbuz.ao.privolgie.app.entity.Cabinet" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="cabinet.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="cabinet.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="cabinet.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="cabinet.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: cabinetInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="cabinet.title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: cabinetInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="cabinet.number"
                                                             default="Number"/></td>

                    <td valign="top" class="value">${fieldValue(bean: cabinetInstance, field: "number")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="cabinet.definition"
                                                             default="Definition"/></td>

                    <td valign="top" class="value">${fieldValue(bean: cabinetInstance, field: "definition")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="cabinet.unit"
                                                             default="Unit"/></td>

                    <td valign="top" class="value"><g:link controller="departmentUnit"
                                                           action="show"
                                                           id="${cabinetInstance?.unit?.id}">${cabinetInstance?.unit?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="cabinet.specialists"
                                                             default="Specialists"/></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${cabinetInstance.specialists}" var="s">
                                <li><g:link controller="specialist" action="show"
                                            id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="cabinet.workplaces"
                                                             default="Workplaces"/></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${cabinetInstance.workplaces}" var="w">
                                <li><g:link controller="workPlace" action="show"
                                            id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                </tbody>
            </table>
        </div>
    </fieldset>
</div>
</body>
</html>
