<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ARM" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="ARM.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="ARM.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="ARM.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="ARM.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${ARMInstance}">
            <div class="errors">
                <g:renderErrors bean="${ARMInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <div class="breadCrumbHolder module">
            <div id="breadCrumb" class="breadCrumb module"></div>
        </div>
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name"><g:message code="ARM.name"
                                                         default="Name"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: ARMInstance, field: 'name', 'errors')}">
                            <g:textField name="name" value="${fieldValue(bean: ARMInstance, field: 'name')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="cabinet"><g:message code="ARM.cabinet"
                                                            default="Cabinet"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: ARMInstance, field: 'cabinet', 'errors')}">
                            <g:select name="cabinet.id" from="${ru.gbuz.ao.privolgie.app.entity.Cabinet.list()}"
                                      optionKey="id" value="${ARMInstance?.cabinet?.id}" noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="systemUnit"><g:message code="ARM.systemUnit"
                                                               default="System Unit"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: ARMInstance, field: 'systemUnit', 'errors')}">
                            <g:select name="systemUnit.id"
                                      from="${ru.gbuz.ao.privolgie.app.inventory.SystemUnit.list()}" optionKey="id"
                                      value="${ARMInstance?.systemUnit?.id}" noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="externalAccessories"><g:message code="ARM.externalAccessories"
                                                                        default="External Accessories"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: ARMInstance, field: 'externalAccessories', 'errors')}">

                            <ul>
                                <g:each in="${ARMInstance?.externalAccessories}" var="externalAccessoryInstance">
                                    <li><g:link controller="externalAccessory" action="show"
                                                id="${externalAccessoryInstance.id}">${externalAccessoryInstance?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller="externalAccessory" params="['ARM.id': ARMInstance?.id]"
                                    action="create"><g:message code="externalAccessory.new"
                                                               default="New ExternalAccessory"/></g:link>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="specialist"><g:message code="ARM.specialist"
                                                               default="Specialist"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: ARMInstance, field: 'specialist', 'errors')}">
                            <g:select name="specialist.id" from="${ru.gbuz.ao.privolgie.app.entity.Specialist.list()}"
                                      optionKey="id" value="${ARMInstance?.specialist?.id}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="workPlaces"><g:message code="ARM.workPlaces"
                                                               default="Work Places"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: ARMInstance, field: 'workPlaces', 'errors')}">
                            <g:select name="workPlaces"
                                      from="${ru.gbuz.ao.privolgie.vocs.WorkPlace.list()}"
                                      size="5" multiple="yes" optionKey="id"
                                      value="${ARMInstance?.workPlaces}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', 'default': 'Edit')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
