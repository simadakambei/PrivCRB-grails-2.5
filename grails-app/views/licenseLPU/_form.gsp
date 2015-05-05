<%@ page import="ru.gbuz.ao.privolgie.app.site.LicenseLPU" %>



<div class="fieldcontain ${hasErrors(bean: licenseLPUInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="licenseLPU.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: licenseLPUInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: licenseLPUInstance, field: 'dateBegin', 'error')} ">
    <label for="dateBegin">
        <g:message code="licenseLPU.dateBegin.label" default="Date Begin"/>

    </label>
    <g:datePicker name="dateBegin" value="${licenseLPUInstance?.dateBegin}" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: licenseLPUInstance, field: 'dateEnd', 'error')} ">
    <label for="dateEnd">
        <g:message code="licenseLPU.dateEnd.label" default="Date End"/>

    </label>
    <g:datePicker name="dateEnd" value="${licenseLPUInstance?.dateEnd}" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: licenseLPUInstance, field: 'definition', 'error')} ">
    <label for="definition">
        <g:message code="licenseLPU.definition.label" default="Definition"/>

    </label>
    <g:textArea name="definition" rows="5" cols="40"
                value="${fieldValue(bean: licenseLPUInstance, field: 'definition')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: licenseLPUInstance, field: 'imageExtension', 'error')} ">
    <label for="imageExtension">
        <g:message code="licenseLPU.imageExtension.label" default="Image Extension"/>

    </label>
    <g:textField name="imageExtension" value="${fieldValue(bean: licenseLPUInstance, field: 'imageExtension')}"/>

</div>

