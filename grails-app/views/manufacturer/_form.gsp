<%@ page import="ru.gbuz.ao.privolgie.vocs.Manufacturer" %>



<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'title', 'error')} required">
    <label for="title">
        <g:message code="manufacturer.title.label" default="Title"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="title" value="${fieldValue(bean: manufacturerInstance, field: 'title')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="manufacturer.description.label" default="Description"/>

    </label>
    <g:textArea name="description" rows="5" cols="40"
                value="${fieldValue(bean: manufacturerInstance, field: 'description')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: manufacturerInstance, field: 'products', 'error')} ">
    <label for="products">
        <g:message code="manufacturer.products.label" default="Products"/>

    </label>

    <ul>
        <g:each in="${manufacturerInstance?.products}" var="productInstance">
            <li><g:link controller="product" action="show"
                        id="${productInstance.id}">${productInstance?.encodeAsHTML()}</g:link></li>
        </g:each>
    </ul>
    <g:link controller="product" params="['manufacturer.id': manufacturerInstance?.id]" action="create"><g:message
            code="product.new" default="New Product"/></g:link>

</div>

