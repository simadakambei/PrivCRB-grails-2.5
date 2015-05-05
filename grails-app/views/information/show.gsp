<%@ page import="ru.gbuz.ao.privolgie.app.site.Information"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="information.show" /></title>
</head>

<body>
	<div class="span-24">
		<g:render template="/partials/menu/menuinformation" />
		<div class="span-6">
			<g:render template="/partials/sideleft" />
		</div>

		<div>
			<span class="menuButton"><g:link class="list" action="list">
					<g:message code="information.list" />
				</g:link></span> <span class="menuButton"><g:link class="create"
					action="create">
					<g:message code="information.new" />
				</g:link></span>
		</div>
		<div class="dialog">
			<fieldset class="ui-corner-all">
				<legend>
					<g:message code="information.show" />
				</legend>
				<g:if test="${flash.message}">
					<div class="message">
						${flash.message}
					</div>
				</g:if>

				<table>
					<tbody>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="information.id" default="Id" /></td>

							<td valign="top" class="value">
								${fieldValue(bean: informationInstance, field: "id")}
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="information.title" default="Title" /></td>

							<td valign="top" class="value">
								${fieldValue(bean: informationInstance, field: "title")}
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="information.dateinfo" default="Dateinfo" /></td>

							<td valign="top" class="value"><g:formatDate
									format="dd MMMMMMMM yyyy hh:mm"
									date="${informationInstance?.dateinfo}" /></td>

						</tr>

						<tr class="prop">
							<td colspan="2" valign="top" class="name"><g:message
									code="information.content" default="Content" /></td>
						</tr>
						<tr class="prop">
							<td colspan="2" valign="top" class="value">
								${raw(informationInstance?.content)}
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="information.visible" default="Visible" /></td>

							<td valign="top" class="value"><g:formatBoolean
									boolean="${informationInstance?.visible}" /></td>

						</tr>

					</tbody>
				</table>


				<div class="buttons">
					<g:form>
						<g:hiddenField name="id" value="${informationInstance?.id}" />
						<span class="button"><g:actionSubmit class="edit"
								action="edit"
								value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
						<span class="button"><g:actionSubmit class="delete"
								action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					</g:form>
				</div>
			</fieldset>
		</div>
	</div>
</body>
</html>
