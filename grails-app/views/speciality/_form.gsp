<%@ page import="ru.gbuz.ao.privolgie.vocs.Speciality" %>



<div class="fieldcontain ${hasErrors(bean: specialityInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="speciality.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: specialityInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: specialityInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="speciality.description.label" default="Description"/>

    </label>
    <g:textArea name="description" rows="5" cols="40"
                value="${fieldValue(bean: specialityInstance, field: 'description')}"/>

</div>

