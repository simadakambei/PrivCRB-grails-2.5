<%@ page import="ru.gbuz.ao.privolgie.app.entity.LPU" %>



<div class="fieldcontain ${hasErrors(bean: LPUInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="LPU.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: LPUInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: LPUInstance, field: 'director', 'error')} ">
    <label for="director">
        <g:message code="LPU.director.label" default="Director"/>

    </label>
    <g:select name="director.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}" optionKey="id"
              value="${LPUInstance?.director?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: LPUInstance, field: 'addres', 'error')} ">
    <label for="addres">
        <g:message code="LPU.addres.label" default="Addres"/>

    </label>
    <g:textArea name="addres" rows="5" cols="40" value="${fieldValue(bean: LPUInstance, field: 'addres')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: LPUInstance, field: 'phone', 'error')} ">
    <label for="phone">
        <g:message code="LPU.phone.label" default="Phone"/>

    </label>
    <g:textField name="phone" value="${fieldValue(bean: LPUInstance, field: 'phone')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: LPUInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="LPU.email.label" default="Email"/>

    </label>
    <g:textField name="email" value="${fieldValue(bean: LPUInstance, field: 'email')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: LPUInstance, field: 'site', 'error')} ">
    <label for="site">
        <g:message code="LPU.site.label" default="Site"/>

    </label>
    <g:textField name="site" value="${fieldValue(bean: LPUInstance, field: 'site')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: LPUInstance, field: 'definition', 'error')} ">
    <label for="definition">
        <g:message code="LPU.definition.label" default="Definition"/>

    </label>
    <g:textArea name="definition" rows="5" cols="40" value="${fieldValue(bean: LPUInstance, field: 'definition')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: LPUInstance, field: 'passportLPU', 'error')} ">
    <label for="passportLPU">
        <g:message code="LPU.passportLPU.label" default="Passport LPU"/>

    </label>
    <g:select name="passportLPU.id" from="${ru.gbuz.ao.privolgie.app.entity.PassportLPU.list()}" optionKey="id"
              value="${LPUInstance?.passportLPU?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: LPUInstance, field: 'departments', 'error')} ">
    <label for="departments">
        <g:message code="LPU.departments.label" default="Departments"/>

    </label>
    <g:select name="departments"
              from="${ru.gbuz.ao.privolgie.app.entity.Department.list()}"
              size="5" multiple="yes" optionKey="id"
              value="${LPUInstance?.departments}"/>

</div>

