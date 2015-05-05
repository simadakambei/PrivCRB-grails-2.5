<%@ page import="ru.gbuz.ao.privolgie.app.site.Information"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="information.create" /></title>
<asset:javascript src="ckeditor/ckeditor.js" />
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
				</g:link></span>
		</div>
		<fieldset class="ui-corner-all">
			<legend>
				<g:message code="information.create" />
			</legend>
			<g:if test="${flash.message}">
				<div class="message">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${informationInstance}">
				<div class="errors">
					<g:renderErrors bean="${informationInstance}" as="list" />
				</div>
			</g:hasErrors>
			<g:form action="save">
				<div class="dialog">
					<table>
						<tbody>

							<tr class="prop">
								<td valign="top" class="name"><label for="title"><g:message
											code="information.title" default="Title" /></label></td>
								<td valign="top"
									class="value ${hasErrors(bean: informationInstance, field: 'title', 'errors')}">
									<g:textField name="title"
										value="${fieldValue(bean: informationInstance, field: 'title')}" />

								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name"><label for="dateinfo"><g:message
											code="information.dateinfo" default="Dateinfo" /></label></td>
								<td valign="top"
									class="value ${hasErrors(bean: informationInstance, field: 'dateinfo', 'errors')}">
									<g:datePicker locale="ru" format="dd.MM.yyyy"
										name="dateinfo" value="${informationInstance?.dateinfo}" />
								</td>
							</tr>

							<tr class="prop">
								<td colspan="2" valign="top" class="name"><label
									for="content"><g:message code="information.content"
											default="Content" /></label></td>
							</tr>
							<tr class="prop">
								<td colspan="2" valign="top"
									class="value ${hasErrors(bean: informationInstance, field: 'content', 'errors')}">
									<g:textArea name="content" id="content" rows="10" cols="80">
										${raw(fieldValue(bean: informationInstance, field: 'content'))}
									</g:textArea> <script>
										CKEDITOR.replace('content');
									</script>

								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name"><label for="visible"><g:message
											code="information.visible" default="Visible" /></label></td>
								<td valign="top"
									class="value ${hasErrors(bean: informationInstance, field: 'visible', 'errors')}">
									<g:checkBox name="visible"
										value="${informationInstance?.visible}" />

								</td>
							</tr>

						</tbody>
					</table>
				</div>

				<div class="buttons">
					<span class="button"><g:submitButton name="create"
							class="save"
							value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
				</div>
			</g:form>
		</fieldset>
	</div>
</body>
</html>
