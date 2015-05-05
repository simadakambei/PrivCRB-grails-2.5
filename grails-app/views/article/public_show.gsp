<%@ page import="ru.gbuz.ao.privolgie.app.site.Article"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="article.show" /></title>
</head>

<body>
	<div class="span-24">
		<g:render template="/partials/menu/menumain" />
		<div class="span-6">
			<g:render template="/partials/sideleft" />
		</div>

		<fieldset class="ui-corner-all">
			<br />
			<g:if test="${flash.message}">
				<div class="message">
					${flash.message}
				</div>
			</g:if>
			<fieldset class="ui-corner-all">
				<legend>
					<g:message code="article.show" />
				</legend>

				<div class="value">
					<h4 class="ui-state-active otstup-left">
						${fieldValue(bean: articleInstance, field: "title")}
					</h4>
					<g:formatDate format="dd MMMMMMMM yyyy hh:mm"
						date="${articleInstance.dateCreated}" />
					<hr />
					${raw(articleInstance?.content)}
				</div>
			</fieldset>
		</fieldset>
	</div>
</body>
</html>
