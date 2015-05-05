<%@ page import="ru.gbuz.ao.privolgie.vocs.ServicePopulation" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="servicePopulation.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="servicePopulation.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="servicePopulation.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="servicePopulation.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="servicePopulation.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: servicePopulationInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="servicePopulation.title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: servicePopulationInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="servicePopulation.description"
                                                             default="Description"/></td>

                    <td valign="top"
                        class="value">${fieldValue(bean: servicePopulationInstance, field: "description")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="servicePopulation.medcode"
                                                             default="Medcode"/></td>

                    <td valign="top" class="value">${fieldValue(bean: servicePopulationInstance, field: "medcode")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="servicePopulation.working"
                                                             default="Working"/></td>

                    <td valign="top" class="value"><g:formatBoolean
                            boolean="${servicePopulationInstance?.working}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="servicePopulation.onsite"
                                                             default="Onsite"/></td>

                    <td valign="top" class="value"><g:formatBoolean
                            boolean="${servicePopulationInstance?.onsite}"/></td>

                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${servicePopulationInstance?.id}"/>
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                <span class="button"><g:actionSubmit class="delete" action="delete"
                                                     value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                     onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
            </g:form>
        </div>
    </fieldset>
</div>
</body>
</html>
