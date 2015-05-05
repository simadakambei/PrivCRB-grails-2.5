<%@ page import="ru.gbuz.ao.privolgie.vocs.SectionMedicalCare" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="sectionMedicalCare.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="sectionMedicalCare.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="sectionMedicalCare.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="id"
                                      title="${message(code: 'sectionMedicalCare.id', default: 'Id')}"/>

                    <g:sortableColumn property="name"
                                      title="${message(code: 'sectionMedicalCare.name', default: 'Name')}"/>

                    <th><g:message code="sectionMedicalCare.specialists"
                                   default="Specialists"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${sectionMedicalCareInstanceList}" status="i" var="sectionMedicalCareInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${sectionMedicalCareInstance.id}">${fieldValue(bean: sectionMedicalCareInstance, field: "id")}</g:link></td>

                        <td>${fieldValue(bean: sectionMedicalCareInstance, field: "name")}</td>

                        <td>${fieldValue(bean: sectionMedicalCareInstance, field: "specialists")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${sectionMedicalCareInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
