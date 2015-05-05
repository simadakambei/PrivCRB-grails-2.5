<%@ page import="ru.gbuz.ao.privolgie.app.site.Information" %>



<div class="fieldcontain ${hasErrors(bean: informationInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="information.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: informationInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: informationInstance, field: 'dateinfo', 'error')} ">
    <label for="dateinfo">
        <g:message code="information.dateinfo.label" default="Dateinfo"/>

    </label>
    <g:datePicker name="dateinfo" value="${informationInstance?.dateinfo}" noSelection="['': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: informationInstance, field: 'content', 'error')} ">
    <label for="content">
        <g:message code="information.content.label" default="Content"/>

    </label>
    <g:textArea name="content" rows="5" cols="40" value="${fieldValue(bean: informationInstance, field: 'content')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: informationInstance, field: 'visible', 'error')} ">
    <label for="visible">
        <g:message code="information.visible.label" default="Visible"/>

    </label>
    <g:checkBox name="visible" value="${informationInstance?.visible}"/>

</div>

