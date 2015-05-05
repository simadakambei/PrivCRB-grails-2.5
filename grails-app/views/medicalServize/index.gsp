<%@ page import="ru.gbuz.ao.privolgie.vocs.MedicalServize" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'medicalServize.label', default: 'MedicalServize')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-medicalServize" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                     default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-medicalServize" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
     
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="code" title="${message(code: 'medicalServize.code.label', default: 'Code')}"/>

            <g:sortableColumn property="name" title="${message(code: 'medicalServize.name.label', default: 'Name')}"/>

            <g:sortableColumn property="cost" title="${message(code: 'medicalServize.cost.label', default: 'Cost')}"/>

            <th><g:message code="medicalServize.sectionMedicalCare.label" default="Section Medical Care"/></th>

            <th><g:message code="medicalServize.specialist.label" default="Specialist"/></th>

            <g:sortableColumn property="definition"
                              title="${message(code: 'medicalServize.definition.label', default: 'Definition')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${medicalServizeInstanceList}" status="i" var="medicalServizeInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${medicalServizeInstance.id}">${fieldValue(bean: medicalServizeInstance, field: "code")}</g:link></td>

                <td>${fieldValue(bean: medicalServizeInstance, field: "name")}</td>

                <td>${fieldValue(bean: medicalServizeInstance, field: "cost")}</td>

                <td>${fieldValue(bean: medicalServizeInstance, field: "sectionMedicalCare")}</td>

                <td>${fieldValue(bean: medicalServizeInstance, field: "specialist")}</td>

                <td>${fieldValue(bean: medicalServizeInstance, field: "definition")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${medicalServizeInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
