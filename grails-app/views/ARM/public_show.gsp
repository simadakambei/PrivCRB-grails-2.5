<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ARM" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="ARM.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="ARM.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="ARM.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="breadCrumbHolder module">
            <div id="breadCrumb" class="breadCrumb module"></div>
        </div>

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="ARM.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: ARMInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="ARM.name"
                                                             default="Name"/></td>

                    <td valign="top" class="value">${fieldValue(bean: ARMInstance, field: "name")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="ARM.cabinet"
                                                             default="Cabinet"/></td>

                    <td valign="top" class="value"><g:link controller="cabinet"
                                                           action="show"
                                                           id="${ARMInstance?.cabinet?.id}">${ARMInstance?.cabinet?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="ARM.systemUnit"
                                                             default="System Unit"/></td>

                    <td valign="top" class="value"><g:link controller="systemUnit"
                                                           action="show"
                                                           id="${ARMInstance?.systemUnit?.id}">${ARMInstance?.systemUnit?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="ARM.externalAccessories"
                                                             default="External Accessories"/></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${ARMInstance.externalAccessories}" var="e">
                                <li><g:link controller="externalAccessory" action="show"
                                            id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="ARM.specialist"
                                                             default="Specialist"/></td>

                    <td valign="top" class="value"><g:link controller="specialist"
                                                           action="show"
                                                           id="${ARMInstance?.specialist?.id}">${ARMInstance?.specialist?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="ARM.workPlaces"
                                                             default="Work Places"/></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${ARMInstance.workPlaces}" var="w">
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
