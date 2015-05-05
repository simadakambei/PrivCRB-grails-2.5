<%@ page import="ru.gbuz.ao.privolgie.vocs.SectionMedicalCare" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="sectionMedicalCare.create"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="sectionMedicalCare.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="sectionMedicalCare.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${sectionMedicalCareInstance}">
            <div class="errors">
                <g:renderErrors bean="${sectionMedicalCareInstance}" as="list"/>
            </div>
        </g:hasErrors>
         
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name"><g:message code="sectionMedicalCare.name"
                                                         default="Name"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: sectionMedicalCareInstance, field: 'name', 'errors')}">
                            <g:textField name="name"
                                         value="${fieldValue(bean: sectionMedicalCareInstance, field: 'name')}"/>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <span class="button"><g:submitButton name="create" class="save"
                                                     value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
            </div>
        </g:form>
    </fieldset>
</div>
</body>
</html>
