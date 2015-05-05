<%@ page import="ru.gbuz.ao.privolgie.vocs.ServiceCommerce" %>



<div class="fieldcontain ${hasErrors(bean: serviceCommerceInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="serviceCommerce.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: serviceCommerceInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceCommerceInstance, field: 'price', 'error')} required">
    <label for="price">
        <g:message code="serviceCommerce.price.label" default="Price"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="price" value="${fieldValue(bean: serviceCommerceInstance, field: 'price')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceCommerceInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="serviceCommerce.description.label" default="Description"/>

    </label>
    <g:textArea name="description" rows="5" cols="40"
                value="${fieldValue(bean: serviceCommerceInstance, field: 'description')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceCommerceInstance, field: 'medcode', 'error')} ">
    <label for="medcode">
        <g:message code="serviceCommerce.medcode.label" default="Medcode"/>

    </label>
    <g:textField name="medcode" value="${fieldValue(bean: serviceCommerceInstance, field: 'medcode')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceCommerceInstance, field: 'working', 'error')} ">
    <label for="working">
        <g:message code="serviceCommerce.working.label" default="Working"/>

    </label>
    <g:checkBox name="working" value="${serviceCommerceInstance?.working}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serviceCommerceInstance, field: 'onsite', 'error')} ">
    <label for="onsite">
        <g:message code="serviceCommerce.onsite.label" default="Onsite"/>

    </label>
    <g:checkBox name="onsite" value="${serviceCommerceInstance?.onsite}"/>

</div>

