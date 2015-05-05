<%@ page import="ru.gbuz.ao.privolgie.app.site.About" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="about.create"/></title>
    <asset:javascript src="ckeditor/ckeditor.js"/>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message
                code="about.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="about.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${aboutInstance}">
            <div class="errors">
                <g:renderErrors bean="${aboutInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <div class="breadCrumbHolder module">
            <div id="breadCrumb" class="breadCrumb module"></div>
        </div>
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="about.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: aboutInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: aboutInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="visible"><g:message code="about.visible" default="Visible"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: aboutInstance, field: 'visible', 'errors')}">
                            <g:checkBox name="visible" value="${aboutInstance?.visible}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td colspan="2" valign="top" class="name">
                            <label for="content"><g:message code="about.content"
                                                            default="Content"/></label>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td colspan="2" valign="top"
                            class="value ${hasErrors(bean: aboutInstance, field: 'content', 'errors')}">
                            <g:textArea name="content" id="content" rows="10" cols="80">
                                ${fieldValue(bean: aboutInstance, field: 'content')}
                            </g:textArea>
                            <script>
                                CKEDITOR.replace('content');
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
