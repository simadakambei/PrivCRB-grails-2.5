<%@ page import="ru.gbuz.ao.privolgie.app.entity.DepartmentUnit" %>



<div class="fieldcontain ${hasErrors(bean: departmentUnitInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="departmentUnit.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: departmentUnitInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentUnitInstance, field: 'director', 'error')} ">
    <label for="director">
        <g:message code="departmentUnit.director.label" default="Director"/>

    </label>
    <g:select name="director.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}" optionKey="id"
              value="${departmentUnitInstance?.director?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentUnitInstance, field: 'addres', 'error')} ">
    <label for="addres">
        <g:message code="departmentUnit.addres.label" default="Addres"/>

    </label>
    <g:textArea name="addres" rows="5" cols="40" value="${fieldValue(bean: departmentUnitInstance, field: 'addres')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentUnitInstance, field: 'phone', 'error')} ">
    <label for="phone">
        <g:message code="departmentUnit.phone.label" default="Phone"/>

    </label>
    <g:textField name="phone" value="${fieldValue(bean: departmentUnitInstance, field: 'phone')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentUnitInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="departmentUnit.email.label" default="Email"/>

    </label>
    <g:textField name="email" value="${fieldValue(bean: departmentUnitInstance, field: 'email')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentUnitInstance, field: 'definition', 'error')} ">
    <label for="definition">
        <g:message code="departmentUnit.definition.label" default="Definition"/>

    </label>
    <g:textArea name="definition" rows="5" cols="40"
                value="${fieldValue(bean: departmentUnitInstance, field: 'definition')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentUnitInstance, field: 'passportLPU', 'error')} ">
    <label for="passportLPU">
        <g:message code="departmentUnit.passportLPU.label" default="Passport LPU"/>

    </label>
    <g:select name="passportLPU.id" from="${ru.gbuz.ao.privolgie.app.entity.PassportLPU.list()}" optionKey="id"
              value="${departmentUnitInstance?.passportLPU?.id}" noSelection="['null': '']"/>

</div>

