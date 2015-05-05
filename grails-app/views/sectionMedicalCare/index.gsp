<%@ page import="ru.gbuz.ao.privolgie.vocs.SectionMedicalCare" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'sectionMedicalCare.label', default: 'SectionMedicalCare')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-sectionMedicalCare" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                         default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-sectionMedicalCare" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
     
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="name"
                              title="${message(code: 'sectionMedicalCare.name.label', default: 'Name')}"/>

            <th><g:message code="sectionMedicalCare.specialists.label" default="Specialists"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${sectionMedicalCareInstanceList}" status="i" var="sectionMedicalCareInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${sectionMedicalCareInstance.id}">${fieldValue(bean: sectionMedicalCareInstance, field: "name")}</g:link></td>

                <td>${fieldValue(bean: sectionMedicalCareInstance, field: "specialists")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${sectionMedicalCareInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
