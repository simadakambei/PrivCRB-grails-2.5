<%@ page import="ru.gbuz.ao.privolgie.app.entity.LPU" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="LPU.show"/></title>
    <asset:javascript src="/map/prototype.js"/>
    <asset:javascript src="openlayers/OpenLayers.js"/>
    <asset:javascript src="/map/gbuz.js"/>
    <asset:javascript src="/map/json-minified.js"/>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menustructure"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <legend class="lpu"><g:message code="LPU.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="dialog">
            <h3>${fieldValue(bean: LPUInstance, field: "title")}</h3>

            <div id="map">

            </div>

            <fieldset class="ui-corner-all odd">
                <g:message code="LPU.full_title"
                           default="Title"/> : ${fieldValue(bean: LPUInstance, field: "full_title")}
                <br/>
                <g:message code="LPU.addres"
                           default="Addres"/> : ${fieldValue(bean: LPUInstance, field: "addres")}
                <br/>
                <g:message code="LPU.phone"
                           default="Phone"/> : ${fieldValue(bean: LPUInstance, field: "phone")}
                <br/>
                <g:message code="LPU.director"
                           default="Director"/> : <g:link controller="person"
                                                          action="public_show"
                                                          target="_blank"
                                                          id="${LPUInstance?.director?.id}">${LPUInstance?.director}</g:link>
                <br/>
                <g:message code="LPU.email"
                           default="Email"/> : ${fieldValue(bean: LPUInstance, field: "email")}
                <br/>
                <g:message code="LPU.passportLPU"
                           default="Passport LPU"/> : <g:link controller="passportLPU"
                                                              action="public_show"
                                                              target="_blankf"
                                                              id="${LPUInstance?.passportLPU?.id}">${LPUInstance?.passportLPU?.encodeAsHTML()}</g:link>
                <br/>
                <g:message code="LPU.departments"
                           default="Departments"/> :
                <ul>
                    <g:each in="${LPUInstance.departments}" var="d">
                        <li><g:link controller="department" action="public_show" target="_blank"
                                    id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>

            </fieldset>

        </div>

    </fieldset>
</div>
</body>
</html>
