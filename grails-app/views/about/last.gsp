<%@ page import="ru.gbuz.ao.privolgie.app.site.About"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="about.show" /></title>

</head>

<body>
	<div class="span-24">
		<g:render template="/partials/menu/menuabout" />
		<div class="span-6">
			<g:render template="/partials/sideleft" />
		</div>
		<div class="dialog">
		<br/>
			<g:each in="${about}" var="aboutInstance">
				<fieldset class="ui-corner-all">
					<legend>
						${aboutInstance.title}
					</legend>
					<g:if test="${flash.message}">
						<div class="message">
							${flash.message}
						</div>
					</g:if>					
					${raw(aboutInstance.content)}
				</fieldset>
			</g:each>
		</div>
	</div>
</body>
</html>
