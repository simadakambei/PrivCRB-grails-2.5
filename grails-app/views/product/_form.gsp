<%@ page import="ru.gbuz.ao.privolgie.vocs.Product" %>



<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="product.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: productInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'specification', 'error')} ">
    <label for="specification">
        <g:message code="product.specification.label" default="Specification"/>

    </label>
    <g:textArea name="specification" rows="5" cols="40"
                value="${fieldValue(bean: productInstance, field: 'specification')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'manufacturer', 'error')} ">
    <label for="manufacturer">
        <g:message code="product.manufacturer.label" default="Manufacturer"/>

    </label>
    <g:select name="manufacturer.id" from="${ru.gbuz.ao.privolgie.vocs.Manufacturer.list()}" optionKey="id"
              value="${productInstance?.manufacturer?.id}" noSelection="['null': '']"/>

</div>

