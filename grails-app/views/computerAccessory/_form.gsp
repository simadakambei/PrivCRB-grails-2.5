<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ComputerAccessory" %>



<div class="fieldcontain ${hasErrors(bean: computerAccessoryInstance, field: 'product', 'error')} required">
    <label for="product">
        <g:message code="computerAccessory.product.label" default="Product"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="product.id" from="${ru.gbuz.ao.privolgie.vocs.Product.list()}" optionKey="id"
              value="${computerAccessoryInstance?.product?.id}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: computerAccessoryInstance, field: 'manufacturer', 'error')} ">
    <label for="manufacturer">
        <g:message code="computerAccessory.manufacturer.label" default="Manufacturer"/>

    </label>
    <g:select name="manufacturer.id" from="${ru.gbuz.ao.privolgie.vocs.Manufacturer.list()}" optionKey="id"
              value="${computerAccessoryInstance?.manufacturer?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: computerAccessoryInstance, field: 'computerAccessoryType', 'error')} required">
    <label for="computerAccessoryType">
        <g:message code="computerAccessory.computerAccessoryType.label" default="Computer Accessory Type"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="computerAccessoryType.id" from="${ru.gbuz.ao.privolgie.vocs.ComputerAccessoryType.list()}"
              optionKey="id" value="${computerAccessoryInstance?.computerAccessoryType?.id}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: computerAccessoryInstance, field: 'systemUnit', 'error')} ">
    <label for="systemUnit">
        <g:message code="computerAccessory.systemUnit.label" default="System Unit"/>

    </label>
    <g:select name="systemUnit.id" from="${ru.gbuz.ao.privolgie.app.inventory.SystemUnit.list()}" optionKey="id"
              value="${computerAccessoryInstance?.systemUnit?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: computerAccessoryInstance, field: 'specification', 'error')} ">
    <label for="specification">
        <g:message code="computerAccessory.specification.label" default="Specification"/>

    </label>
    <g:textArea name="specification" rows="5" cols="40"
                value="${fieldValue(bean: computerAccessoryInstance, field: 'specification')}"/>

</div>

