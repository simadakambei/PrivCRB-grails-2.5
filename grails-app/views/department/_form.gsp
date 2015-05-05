<%@ page import="ru.gbuz.ao.privolgie.app.entity.Department" %>



<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="department.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: departmentInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'director', 'error')} ">
    <label for="director">
        <g:message code="department.director.label" default="Director"/>

    </label>
    <g:select name="director.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}" optionKey="id"
              value="${departmentInstance?.director?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'addres', 'error')} ">
    <label for="addres">
        <g:message code="department.addres.label" default="Addres"/>

    </label>
    <g:textArea name="addres" rows="5" cols="40" value="${fieldValue(bean: departmentInstance, field: 'addres')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'phone', 'error')} ">
    <label for="phone">
        <g:message code="department.phone.label" default="Phone"/>

    </label>
    <g:textField name="phone" value="${fieldValue(bean: departmentInstance, field: 'phone')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="department.email.label" default="Email"/>

    </label>
    <g:textField name="email" value="${fieldValue(bean: departmentInstance, field: 'email')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'definition', 'error')} ">
    <label for="definition">
        <g:message code="department.definition.label" default="Definition"/>

    </label>
    <g:textArea name="definition" rows="5" cols="40"
                value="${fieldValue(bean: departmentInstance, field: 'definition')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'passportLPU', 'error')} ">
    <label for="passportLPU">
        <g:message code="department.passportLPU.label" default="Passport LPU"/>

    </label>
    <g:select name="passportLPU.id" from="${ru.gbuz.ao.privolgie.app.entity.PassportLPU.list()}" optionKey="id"
              value="${departmentInstance?.passportLPU?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'lpu', 'error')} ">
    <label for="lpu">
        <g:message code="department.lpu.label" default="Lpu"/>

    </label>
    <g:select name="lpu.id" from="${ru.gbuz.ao.privolgie.app.entity.LPU.list()}" optionKey="id"
              value="${departmentInstance?.lpu?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'district', 'error')} ">
    <label for="district">
        <g:message code="department.district.label" default="District"/>

    </label>
    <g:select name="district.id" from="${ru.gbuz.ao.privolgie.app.entity.District.list()}" optionKey="id"
              value="${departmentInstance?.district?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'longitude', 'error')} ">
    <label for="longitude">
        <g:message code="department.longitude.label" default="Longitude"/>

    </label>
    <g:textField name="longitude" value="${fieldValue(bean: departmentInstance, field: 'longitude')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'latitude', 'error')} ">
    <label for="latitude">
        <g:message code="department.latitude.label" default="Latitude"/>

    </label>
    <g:textField name="latitude" value="${fieldValue(bean: departmentInstance, field: 'latitude')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'units', 'error')} ">
    <label for="units">
        <g:message code="department.units.label" default="Units"/>

    </label>

    <ul>
        <g:each in="${departmentInstance?.units}" var="departmentUnitInstance">
            <li><g:link controller="departmentUnit" action="show"
                        id="${departmentUnitInstance.id}">${departmentUnitInstance?.encodeAsHTML()}</g:link></li>
        </g:each>
    </ul>
    <g:link controller="departmentUnit" params="['department.id': departmentInstance?.id]" action="create"><g:message
            code="departmentUnit.new" default="New DepartmentUnit"/></g:link>

</div>

