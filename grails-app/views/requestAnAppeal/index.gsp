<%@ page import="ru.gbuz.ao.privolgie.app.site.RequestAnAppeal" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'requestAnAppeal.label', default: 'RequestAnAppeal')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-requestAnAppeal" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                      default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-requestAnAppeal" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="requestFIO"
                              title="${message(code: 'requestAnAppeal.requestFIO.label', default: 'Request FIO')}"/>

            <g:sortableColumn property="requestAddres"
                              title="${message(code: 'requestAnAppeal.requestAddres.label', default: 'Request Addres')}"/>

            <g:sortableColumn property="phone"
                              title="${message(code: 'requestAnAppeal.phone.label', default: 'Phone')}"/>

            <g:sortableColumn property="email"
                              title="${message(code: 'requestAnAppeal.email.label', default: 'Email')}"/>

            <g:sortableColumn property="requestDate"
                              title="${message(code: 'requestAnAppeal.requestDate.label', default: 'Request Date')}"/>

            <th><g:message code="requestAnAppeal.officialPost.label" default="Official Post"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${requestAnAppealInstanceList}" status="i" var="requestAnAppealInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${requestAnAppealInstance.id}">${fieldValue(bean: requestAnAppealInstance, field: "requestFIO")}</g:link></td>

                <td>${fieldValue(bean: requestAnAppealInstance, field: "requestAddres")}</td>

                <td>${fieldValue(bean: requestAnAppealInstance, field: "phone")}</td>

                <td>${fieldValue(bean: requestAnAppealInstance, field: "email")}</td>

                <td><g:formatDate date="${requestAnAppealInstance.requestDate}"/></td>

                <td>${fieldValue(bean: requestAnAppealInstance, field: "officialPost")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${requestAnAppealInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
