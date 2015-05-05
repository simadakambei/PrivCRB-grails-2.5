<%@ page import="ru.gbuz.ao.privolgie.app.entity.DepartmentUnit" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="departmentUnit.show"/></title>
    <asset:javascript src="noConflict.js"/>
    <asset:javascript src="/map/prototype.js"/>
    <asset:javascript src="openlayers/OpenLayers.js"/>
    <asset:javascript src="/map/departmentunit.js"/>
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
        <legend><g:message code="departmentUnit.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="dialog">
            <h3>${fieldValue(bean: departmentUnitInstance, field: "title")}</h3>

            <div id="map">

            </div>
            <fieldset class="ui-corner-all odd">
                <g:message code="departmentUnit.director"
                           default="Director"/> :
                <g:link controller="person"
                        action="public_show"
                        target="_blank"
                        id="${departmentUnitInstance?.director?.id}">${departmentUnitInstance?.director?.encodeAsHTML()}</g:link>
                <br/>
                <g:message code="departmentUnit.addres"
                           default="Addres"/> : ${fieldValue(bean: departmentUnitInstance, field: "addres")}
                <br/>
                <g:message code="departmentUnit.phone"
                           default="Phone"/> : ${fieldValue(bean: departmentUnitInstance, field: "phone")}
                <br/>
                <g:message code="departmentUnit.email"
                           default="Email"/> : ${fieldValue(bean: departmentUnitInstance, field: "email")}
                <br/>
                <g:message code="departmentUnit.passportLPU"
                           default="Passport LPU"/> :
                <g:link controller="passportLPU"
                        action="public_show"
                        target="_blank"
                        id="${departmentUnitInstance?.passportLPU?.id}">${departmentUnitInstance?.passportLPU?.encodeAsHTML()}</g:link>
                <br/>
                <g:message code="departmentUnit.department"
                           default="Department"/> :
                <g:link controller="department"
                        action="public_show"
                        target="_blank"
                        id="${departmentUnitInstance?.department?.id}">${departmentUnitInstance?.department?.encodeAsHTML()}</g:link>
                <br/>
                <g:message code="department.district"
                           default="District"/> :
                <g:link controller="district"
                        action="public_show"
                        target="_blank"
                        id="${departmentUnitInstance?.department?.district?.id}">${departmentUnitInstance?.department?.district?.encodeAsHTML()}</g:link>
                <br/>

            </fieldset>
        </div>
    </fieldset>
</div>
</body>
</html>
