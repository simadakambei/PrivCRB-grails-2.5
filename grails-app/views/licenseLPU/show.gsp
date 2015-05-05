<%@ page import="ru.gbuz.ao.privolgie.app.site.LicenseLPU" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="licenseLPU.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menulicenselpu"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="licenseLPU.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="licenseLPU.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="licenseLPU.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="licenseLPU.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: licenseLPUInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="licenseLPU.title"
                                                             default="Title"/></td>

                    <td valign="top" class="value">${fieldValue(bean: licenseLPUInstance, field: "title")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="licenseLPU.dateBegin"
                                                             default="Date Begin"/></td>

                    <td valign="top" class="value"><g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${licenseLPUInstance?.dateBegin}"/></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="licenseLPU.dateEnd"
                                                             default="Date End"/></td>

                    <td valign="top" class="value"><g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${licenseLPUInstance?.dateEnd}"/></td>

                </tr>

                <tr class="prop">
                    <td colspan="2" valign="top" class="name"><g:message code="licenseLPU.definition"
                                                                         default="Definition"/></td>
                </tr>
                <tr class="prop">
                    <td colspan="2" valign="top"
                        class="value">${raw(licenseLPUInstance?.definition)}</td>
                <g:link uri="images/lic_20_05_2014.pdf" >Лицензия</g:link>
                </tr>



                </tbody>
            </table>
        </div>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${licenseLPUInstance?.id}"/>
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
