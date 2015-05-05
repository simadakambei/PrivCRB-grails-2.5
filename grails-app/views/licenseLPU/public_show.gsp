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

    <fieldset class="ui-corner-all">
        <legend>${fieldValue(bean: licenseLPUInstance, field: "title")}</legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <fieldset class="ui-corner-all">
                <br/>
                <table class="otstup-top">
                    <tbody>

                    <tr>
                        <td>
                            <g:message code="licenseLPU.dateBegin"/>
                        </td>
                        <td>
                            <g:formatDate format="dd MMMMMMMM yyyy" date="${licenseLPUInstance.dateBegin}"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <g:message code="licenseLPU.dateEnd"/>
                        </td>
                        <td>
                            <g:formatDate format="dd MMMMMMMM yyyy" date="${licenseLPUInstance.dateEnd}"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <g:message code="licenseLPU.definition"/>
                        </td>
                        </tr>
                    <tr>
                        <td colspan="2">
                            ${raw(licenseLPUInstance?.definition)}
                        </td>
                    </tr>


                    </tbody>
                </table>

            </fieldset>
        </div>
    </fieldset>
</div>
</body>
</html>
