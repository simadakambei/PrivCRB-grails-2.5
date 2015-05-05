<%@ page import="ru.gbuz.ao.privolgie.app.site.LicenseLPU" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="licenseLPU.create"/></title>
    <asset:javascript src="ckeditor/ckeditor.js"/>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menulicenselpu"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="licenseLPU.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="licenseLPU.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${licenseLPUInstance}">
            <div class="errors">
                <g:renderErrors bean="${licenseLPUInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form action="save" method="post" enctype="multipart/form-data">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="licenseLPU.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: licenseLPUInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: licenseLPUInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateBegin"><g:message code="licenseLPU.dateBegin"
                                                              default="Date Begin"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: licenseLPUInstance, field: 'dateBegin', 'errors')}">
                            <g:datePicker locale="ru" format="dd.MM.yyyy" name="dateBegin"
                                                value="${licenseLPUInstance?.dateBegin}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateEnd"><g:message code="licenseLPU.dateEnd"
                                                            default="Date End"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: licenseLPUInstance, field: 'dateEnd', 'errors')}">
                            <g:datePicker locale="ru" format="dd.MM.yyyy" name="dateEnd"
                                                value="${licenseLPUInstance?.dateEnd}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td colspan="2" valign="top" class="name">
                            <label for="definition"><g:message code="licenseLPU.definition"
                                                            default="Definition"/></label>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td colspan="2" valign="top"
                            class="value ${hasErrors(bean:licenseLPUInstance, field: 'definition', 'errors')}">
                            <g:textArea name="definition" id="definition" rows="10" cols="80">
                                ${raw(fieldValue(bean: licenseLPUInstance, field: 'definition'))}
                            </g:textArea>
                            <script>
                                CKEDITOR.replace('definition');
                            </script>

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
