<%@ page import="ru.gbuz.ao.privolgie.app.entity.District" %>



<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="district.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: districtInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'definition', 'error')} ">
    <label for="definition">
        <g:message code="district.definition.label" default="Definition"/>

    </label>
    <g:textField name="definition" value="${fieldValue(bean: districtInstance, field: 'definition')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'departments', 'error')} ">
    <label for="departments">
        <g:message code="district.departments.label" default="Departments"/>

    </label>

    <ul>
        <g:each in="${districtInstance?.departments}" var="departmentInstance">
            <li><g:link controller="department" action="show"
                        id="${departmentInstance.id}">${departmentInstance?.encodeAsHTML()}</g:link></li>
        </g:each>
    </ul>
    <g:link controller="department" params="['district.id': districtInstance?.id]" action="create"><g:message
            code="department.new" default="New Department"/></g:link>

</div>

