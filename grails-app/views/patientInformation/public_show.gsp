<%@ page import="ru.gbuz.ao.privolgie.app.site.PatientInformation"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="patientInformation.show" /></title>
</head>

<body>
	<div class="span-24">
		<g:render template="/partials/menu/menupatientinformation" />
		<div class="span-6">
			<g:render template="/partials/sideleft" />
		</div>

		<fieldset class="ui-corner-all">
			<g:if test="${flash.message}">
				<div class="message">
					${flash.message}
				</div>
			</g:if>
			<div class="dialog">
				<fieldset class="ui-corner-all">
					<div class="value">
						<h4 class="ui-state-active otstup-left">
							${fieldValue(bean: patientInformationInstance, field: "title")}
						</h4>
						<g:formatDate format="dd MMMMMMMM yyyy hh:mm"
							date="${patientInformationInstance?.dateInfo}" />
						<hr />
						${raw(patientInformationInstance?.content)}
					</div>
				</fieldset>
			</div>
		</fieldset>
	</div>
</body>
</html>
