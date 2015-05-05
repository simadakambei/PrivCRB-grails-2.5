<%@ page import="ru.gbuz.ao.privolgie.app.inventory.ExternalAccessory" %>



<div class="fieldcontain ${hasErrors(bean: externalAccessoryInstance, field: 'product', 'error')} required">
    <label for="product">
        <g:message code="externalAccessory.product.label" default="Product"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="product.id" from="${ru.gbuz.ao.privolgie.vocs.Product.list()}" optionKey="id"
              value="${externalAccessoryInstance?.product?.id}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: externalAccessoryInstance, field: 'manufacturer', 'error')} ">
    <label for="manufacturer">
        <g:message code="externalAccessory.manufacturer.label" default="Manufacturer"/>

    </label>
    <g:select name="manufacturer.id" from="${ru.gbuz.ao.privolgie.vocs.Manufacturer.list()}" optionKey="id"
              value="${externalAccessoryInstance?.manufacturer?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: externalAccessoryInstance, field: 'externalAccessoryType', 'error')} required">
    <label for="externalAccessoryType">
        <g:message code="externalAccessory.externalAccessoryType.label" default="External Accessory Type"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="externalAccessoryType.id" from="${ru.gbuz.ao.privolgie.vocs.ExternalAccessoryType.list()}"
              optionKey="id" value="${externalAccessoryInstance?.externalAccessoryType?.id}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: externalAccessoryInstance, field: 'inventNumber', 'error')} ">
    <label for="inventNumber">
        <g:message code="externalAccessory.inventNumber.label" default="Invent Number"/>

    </label>
    <g:textField name="inventNumber" value="${fieldValue(bean: externalAccessoryInstance, field: 'inventNumber')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: externalAccessoryInstance, field: 'arm', 'error')} ">
    <label for="arm">
        <g:message code="externalAccessory.arm.label" default="Arm"/>

    </label>
    <g:select name="arm.id" from="${ru.gbuz.ao.privolgie.app.inventory.ARM.list()}" optionKey="id"
              value="${externalAccessoryInstance?.arm?.id}" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: externalAccessoryInstance, field: 'specification', 'error')} ">
    <label for="specification">
        <g:message code="externalAccessory.specification.label" default="Specification"/>

    </label>
    <g:textArea name="specification" rows="5" cols="40"
                value="${fieldValue(bean: externalAccessoryInstance, field: 'specification')}"/>

</div>

