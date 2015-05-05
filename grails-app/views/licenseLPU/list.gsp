<%@ page import="ru.gbuz.ao.privolgie.app.site.LicenseLPU" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="licenseLPU.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menulicenselpu"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="licenseLPU.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="licenseLPU.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <table>
                <thead class="ui-state-default center">


                <g:sortableColumn property="title"
                                  title="${message(code: 'licenseLPU.title', default: 'Title')}"/>

                <g:sortableColumn property="dateBegin"
                                  title="${message(code: 'licenseLPU.dateBegin', default: 'Date Begin')}"/>

                <g:sortableColumn property="dateEnd"
                                  title="${message(code: 'licenseLPU.dateEnd', default: 'Date End')}"/>

                <g:sortableColumn property="definition"
                                  title="${message(code: 'licenseLPU.definition', default: 'Definition')}"/>


                </tr>
                </thead>
                <tbody>
                <g:each in="${licenseLPUInstanceList}" status="i" var="licenseLPUInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">


                        <td><g:link action="show"
                                    id="${licenseLPUInstance.id}">${fieldValue(bean: licenseLPUInstance, field: "title")}</g:link></td>

                        <td><g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${licenseLPUInstance.dateBegin}"/></td>

                        <td><g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${licenseLPUInstance.dateEnd}"/></td>

                        <td>${raw(licenseLPUInstance?.definition)}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${licenseLPUInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
