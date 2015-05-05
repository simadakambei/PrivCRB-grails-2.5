<%@ page import="ru.gbuz.ao.privolgie.app.site.About" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="about.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menuabout"/>
    <div class="span-6 float-left">
        <g:render template="/partials/sideleft"/>
    </div>

    <div class="span-17">
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="about.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="about.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>

        <div class="list span-17">
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'about.title', default: 'Title')}"/>

                    <g:sortableColumn property="visible"
                                      title="${message(code: 'about.visible', default: 'Visiblee')}"/>

                    <g:sortableColumn property="content"
                                      title="${message(code: 'about.content', default: 'Content')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${aboutInstanceList}" status="i" var="aboutInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${aboutInstance.id}">${fieldValue(bean: aboutInstance, field: "title")}</g:link></td>

                        <td><g:formatBoolean boolean="${aboutInstance.visible}" true="${message(code: 'about.visible')}"
                                             false="${message(code: 'default.boolean.false')}"/></td>

                        <td class="span-16">${raw(aboutInstance?.content)}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${aboutInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
