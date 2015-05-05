<%@ page import="ru.gbuz.ao.privolgie.vocs.ServicePopulation" %>



<div class="fieldcontain ${hasErrors(bean: servicePopulationInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="servicePopulation.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: servicePopulationInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: servicePopulationInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="servicePopulation.description.label" default="Description"/>

    </label>
    <g:textArea name="description" rows="5" cols="40"
                value="${fieldValue(bean: servicePopulationInstance, field: 'description')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: servicePopulationInstance, field: 'medcode', 'error')} ">
    <label for="medcode">
        <g:message code="servicePopulation.medcode.label" default="Medcode"/>

    </label>
    <g:textField name="medcode" value="${fieldValue(bean: servicePopulationInstance, field: 'medcode')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: servicePopulationInstance, field: 'working', 'error')} ">
    <label for="working">
        <g:message code="servicePopulation.working.label" default="Working"/>

    </label>
    <g:checkBox name="working" value="${servicePopulationInstance?.working}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: servicePopulationInstance, field: 'onsite', 'error')} ">
    <label for="onsite">
        <g:message code="servicePopulation.onsite.label" default="Onsite"/>

    </label>
    <g:checkBox name="onsite" value="${servicePopulationInstance?.onsite}"/>

</div>

