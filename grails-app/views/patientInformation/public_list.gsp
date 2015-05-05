<%@ page import="ru.gbuz.ao.privolgie.app.site.PatientInformation"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="patientInformation.list" /></title>

</head>

<body>
	<div class="span-24">
		<g:render template="/partials/menu/menupatientinformation" />
		<div class="span-6">
			<g:render template="/partials/sideleft" />
		</div>
		<div class="list">
			
			<br />
			<fieldset class="ui-corner-all">
				<g:if test="${flash.message}">
					<div class="message">
						${flash.message}
					</div>
				</g:if>

				<p class="prop-tiny">В данном разделе Вы можете ознакомиться с
					разнообразной информацией, которая может помочь Вам при обращении в
					наше учреждение. При работе с пациентами наше учреждение
					руководствуется федеральным и региональным законодательством,
					различными нормативными документами, которые Вы можете найти на
					нашем сайте в данном разделе.</p>

				<p class="prop-tiny">Информация разделена по разделам для
					удобства пользования, при невозможности найти интересующую Вас
					документацию или информацию Вы можете воспользоваться формой
					обратной связи.</p>

				<div id="accordition_pi" class="small"
					xmlns="http://www.w3.org/1999/html">
					<g:each in="${patientInformationTypeList}" status="i"
						var="patientInformationTypeInstance">
						<h3>
							<a href="#">
								${patientInformationTypeInstance.name}
							</a>
						</h3>

						<div>
							<g:each
								in="${patientInformationTypeInstance?.patientInformations.sort(true)}"
								status="j" var="patientInformationInstance">
								<div>
									<g:link controller="patientInformation" action="public_show"
										id="${patientInformationInstance?.id}">
										${patientInformationInstance.title}
									</g:link>
								</div>
							</g:each>
						</div>
					</g:each>
				</div>
		</div>

		</fieldset>
	</div>
</body>
</html>
