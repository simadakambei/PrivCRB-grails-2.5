<%@ page import="ru.gbuz.ao.privolgie.vocs.MedicalServize" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="medicalServize.edit"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumedicalservize"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="medicalServize.list"/></g:link></span>
        <span class="menuButton"><g:link class="create" action="create"><g:message
                code="medicalServize.create"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="medicalServize.choice"/></legend>

        <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}"
                                            default="${flash.defaultMessage}"/></div>
        </g:if>
        <g:hasErrors bean="${medicalServizeInstance}">
            <div class="errors">
                <g:renderErrors bean="${medicalServizeInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form method="post">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="code"><g:message code="medicalServize.code"
                                                         default="Code"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: medicalServizeInstance, field: 'code', 'errors')}">
                            <g:textField name="code"
                                         value="${fieldValue(bean: medicalServizeInstance, field: 'code')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name"><g:message code="medicalServize.name"
                                                         default="Name"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: medicalServizeInstance, field: 'name', 'errors')}">
                            <g:textField name="name"
                                         value="${fieldValue(bean: medicalServizeInstance, field: 'name')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="cost"><g:message code="medicalServize.cost"
                                                         default="Cost"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: medicalServizeInstance, field: 'cost', 'errors')}">
                            <g:textField name="cost"
                                         value="${fieldValue(bean: medicalServizeInstance, field: 'cost')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="sectionMedicalCare"><g:message code="medicalServize.sectionMedicalCare"
                                                                       default="Section Medical Care"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: medicalServizeInstance, field: 'sectionMedicalCare', 'errors')}">
                            <g:select name="sectionMedicalCare.id"
                                      from="${ru.gbuz.ao.privolgie.vocs.SectionMedicalCare.list()}" optionKey="id"
                                      value="${medicalServizeInstance?.sectionMedicalCare?.id}"
                                      noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="specialist"><g:message code="medicalServize.specialist"
                                                               default="Specialist"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: medicalServizeInstance, field: 'specialist', 'errors')}">
                            <g:select name="specialist.id" from="${ru.gbuz.ao.privolgie.app.entity.Specialist.list()}"
                                      optionKey="id" value="${medicalServizeInstance?.specialist?.id}"
                                      noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="definition"><g:message code="medicalServize.definition"
                                                               default="Definition"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: medicalServizeInstance, field: 'definition', 'errors')}">
                            <g:textField name="definition"
                                         value="${fieldValue(bean: medicalServizeInstance, field: 'definition')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="actuality"><g:message code="medicalServize.actuality"
                                                              default="Actuality"/>:</label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: medicalServizeInstance, field: 'actuality', 'errors')}">
                            <g:checkBox name="actuality" value="${medicalServizeInstance?.actuality}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="edit" action="edit"
                                                     value="${message(code: 'default.button.edit.label', 'default': 'Edit')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
