<%@ page import="ru.gbuz.ao.privolgie.app.entity.Department" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="department.show"/></title>
    <asset:javascript src="noConflict.js"/>
    <asset:javascript src="/map/prototype.js"/>
    <asset:javascript src="openlayers/OpenLayers.js"/>
    <asset:javascript src="/map/department.js"/>
    <asset:javascript src="/map/json-minified.js"/>
    <asset:javascript src="noConflict.js"/>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menustructure"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <legend><g:message code="department.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>        

        <div class="dialog">
            <h3>${fieldValue(bean: departmentInstance, field: "title")}</h3>

            <div id="map">

            </div>
            <fieldset class="ui-corner-all odd">
                <strong><g:message code="department.director"
                                   default="Director"/> :</strong>
                <g:link controller="person"
                        action="public_show"
                        target="_blank"
                        id="${departmentInstance?.director?.id}">${departmentInstance?.director?.encodeAsHTML()}</g:link>
                <br/>
                <strong><g:message code="department.addres"
                                   default="Addres"/> :</strong> ${fieldValue(bean: departmentInstance, field: "addres")}
                <br/>
                <strong><g:message code="department.transport"
                                   default="Transport"/> :</strong> ${fieldValue(bean: departmentInstance, field: "transport")}
                <br/>
                <strong><g:message code="department.phone"
                                   default="Phone"/> :</strong> ${fieldValue(bean: departmentInstance, field: "phone")}
                <br/>
                <strong><g:message code="department.email"
                                   default="Email"/> :</strong> ${fieldValue(bean: departmentInstance, field: "email")}
                <br/>
                <strong><g:message code="department.passportLPU"
                                   default="Passport LPU"/> :</strong>
                <g:link controller="passportLPU"
                        action="public_show"
                        target="_blank"
                        id="${departmentInstance?.passportLPU?.id}">${departmentInstance?.passportLPU?.encodeAsHTML()}</g:link>
                <br/>
                <strong><g:message code="department.lpu"
                                   default="Lpu"/> :</strong>
                <g:link controller="LPU"
                        action="public_show"
                        target="_blank"
                        id="${departmentInstance?.lpu?.id}">${departmentInstance?.lpu?.encodeAsHTML()}</g:link>
                <br/>
                <strong><g:message code="department.district"
                                   default="District"/> :</strong>
                <g:link controller="district"
                        action="public_show"
                        target="_blank"
                        id="${departmentInstance?.district?.id}">${departmentInstance?.district?.encodeAsHTML()}</g:link>
                <br/>
                <strong><g:message code="department.units"
                                   default="Units"/> :</strong>
                <ul>
                    <g:each in="${departmentInstance.units}" var="u">
                        <li><g:link controller="departmentUnit" action="public_show" target="_blank"
                                    id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
                    </g:each>
                </ul>
            </fieldset>
        </div>
    </fieldset>
</div>
</body>
</html>
