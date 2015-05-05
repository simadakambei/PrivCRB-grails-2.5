<%@ page import="ru.gbuz.ao.privolgie.app.site.Sanprosvet" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="sanprosvet.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="sanprosvet.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="sanprosvet.new"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="sanprosvet.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <fieldset class="ui-corner-all">
            <div class="value">
                <h4 class="ui-state-active otstup-left">${fieldValue(bean: sanprosvetInstance, field: "title")}</h4>
                <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${sanprosvetInstance.dateCreated}"/>
                <hr/>
                ${raw(sanprosvetInstance?.content)}
            </div>
        </fieldset>

        <div class="buttons">
            <g:form>
                <g:hiddenField name="id" value="${sanprosvetInstance?.id}"/>
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
