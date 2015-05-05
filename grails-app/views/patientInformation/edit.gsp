<%@ page import="ru.gbuz.ao.privolgie.app.site.PatientInformation"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="patientInformation.edit" /></title>
<asset:javascript src="ckeditor/ckeditor.js" />
</head>

<body>
	<div class="span-24">
		<g:render template="/partials/menu/menupatientinformation" />
		<div class="span-6">
			<g:render template="/partials/sideleft" />
		</div>

		<div>
			<span class="menuButton"><g:link class="list" action="list">
					<g:message code="patientInformation.list" />
				</g:link></span> <span class="menuButton"><g:link class="create"
					action="create">
					<g:message code="patientInformation.create" />
				</g:link></span>
		</div>
		<div class="dialog">
			<fieldset class="ui-corner-all">
				<legend>
					<g:message code="patientInformation.edit" />
				</legend>

				<g:if test="${flash.message}">
					<div class="message">
						${flash.message}
					</div>
				</g:if>
				<g:hasErrors bean="${patientInformationInstance}">
					<div class="errors">
						<g:renderErrors bean="${patientInformationInstance}" as="list" />
					</div>
				</g:hasErrors>

				<g:form method="post">
					<g:hiddenField name="id" value="${patientInformationInstance?.id}" />
					<g:hiddenField name="version"
						value="${patientInformationInstance?.version}" />

					<table>
						<tbody>

							<tr class="prop">
								<td valign="top" class="name"><label for="title"><g:message
											code="patientInformation.title" default="Title" /></label></td>
								<td valign="top"
									class="value ${hasErrors(bean: patientInformationInstance, field: 'title', 'errors')}">
									<g:textField name="title"
										value="${fieldValue(bean: patientInformationInstance, field: 'title')}" />

								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name"><label for="dateInfo"><g:message
											code="patientInformation.dateInfo" default="Date Info" /></label></td>
								<td valign="top"
									class="value ${hasErrors(bean: patientInformationInstance, field: 'dateInfo', 'errors')}">
									<g:datePicker locale="ru" format="dd.MM.yyyy" name="dateInfo"
										value="${patientInformationInstance?.dateInfo}" />
								</td>
							</tr>

							<tr class="prop">
								<td colspan="2" valign="top" class="name"><label
									for="content"><g:message
											code="patientInformation.content" default="Content" /></label></td>
							</tr>
							<tr class="prop">
								<td colspan="2" valign="top"
									class="value ${hasErrors(bean: patientInformationInstance, field: 'content', 'errors')}">
									<g:textArea name="content" id="content" rows="10" cols="80">
										${fieldValue(bean: patientInformationInstance, field: 'content')}
									</g:textArea> <script>
										CKEDITOR.replace('content');
									</script>
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name"><label
									for="patientInformationType"><g:message
											code="patientInformation.type"
											default="type Patient's Information" /></label></td>
								<td valign="top"
									class="value ${hasErrors(bean: patientInformationInstance, field: 'pationInformationType', 'errors')}">
									<g:select name="patientInformationType.id"
										from="${ru.gbuz.ao.privolgie.vocs.PatientInformationType.list()}"
										optionKey="id"
										value="${patientInformationInstance?.patientInformationType?.id}"
										noSelection="['null': '- Выбор типа информации -']" />

								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name"><label for="visible"><g:message
											code="patientInformation.visible" default="Visible" /></label></td>
								<td valign="top"
									class="value ${hasErrors(bean: patientInformationInstance, field: 'visible', 'errors')}">
									<g:checkBox name="visible"
										value="${patientInformationInstance?.visible}" />

								</td>
							</tr>

						</tbody>
					</table>


					<div class="buttons">
						<span class="button"><g:actionSubmit class="save"
								action="update"
								value="update" /></span>
						<span class="button"><g:actionSubmit class="delete"
								action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					</div>
				</g:form>
			</fieldset>
		</div>
	</div>
</body>
</html>
