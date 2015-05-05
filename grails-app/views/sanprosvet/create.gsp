<%@ page import="ru.gbuz.ao.privolgie.app.site.Sanprosvet" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="sanprosvet.create"/></title>
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
                code="sanprosvet.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="sanprosvet.create"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${sanprosvetInstance}">
            <div class="errors">
                <g:renderErrors bean="${sanprosvetInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form action="save">
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title"><g:message code="sanprosvet.title"
                                                          default="Title"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: sanprosvetInstance, field: 'title', 'errors')}">
                            <g:textField name="title" value="${fieldValue(bean: sanprosvetInstance, field: 'title')}"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="author"><g:message code="sanprosvet.author"
                                                           default="Author"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: sanprosvetInstance, field: 'author', 'errors')}">
                            <g:select name="author.id" from="${ru.gbuz.ao.privolgie.security.Person.list()}"
                                      optionKey="id" value="${sanprosvetInstance?.author?.id}"
                                      noSelection="['null': '']"/>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateCreated"><g:message code="sanprosvet.dateCreated"
                                                                default="Date Created"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: sanprosvetInstance, field: 'dateCreated', 'errors')}">
                            <g:datePicker locale="ru" format="dd.MM.yyyy" name="dateCreated"
                                          value="${sanprosvetInstance?.dateCreated}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td colspan="2" valign="top" class="name">
                            <label for="content"><g:message code="sanprosvet.content"
                                                            default="Content"/></label>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td colspan="2" valign="top"
                            class="value ${hasErrors(bean: sanprosvetInstance, field: 'content', 'errors')}">
                            <g:textArea name="content" id="content" rows="10" cols="80">
                                ${raw(fieldValue(bean: sanprosvetInstance, field: 'content'))}
                            </g:textArea>
                            <script>
                                CKEDITOR.replace('content');
                            </script>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="archive"><g:message code="sanprosvet.archive"
                                                            default="Archive"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: sanprosvetInstance, field: 'archive', 'errors')}">
                            <g:checkBox name="archive" value="${sanprosvetInstance?.archive}"/>

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
