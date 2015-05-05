<%@ page import="ru.gbuz.ao.privolgie.app.site.Information"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="information.list" /></title>
</head>

<body>
	<div class="span-24">
		<g:render template="/partials/menu/menuinformation" />
		<div class="span-6">
			<g:render template="/partials/sideleft" />
		</div>

		<fieldset class="ui-corner-all">
			<legend>
				<g:message code="information.list" />
			</legend>
			<g:if test="${flash.message}">
				<div class="message">
					${flash.message}
				</div>
			</g:if>
			<div class="list">
				<blockquote>На данной странице Вы можете ознакомиться с
					информационными сообщениями нашего учреждения, объявлениями,
					событиями, проводимыми мероприятиями. Информация оперативно
					обновляется по мере поступления</blockquote>
				<g:each in="${informationInstanceList.reverse(true)}" status="i"
					var="informationInstance">
					<fieldset class="ui-corner-all">
						<h4 class="ui-state-active otstup-left">
							<g:formatDate format="dd MMMMMMMM yyyy hh:mm"
							date="${informationInstance.dateinfo}" />
						</h4>						
						<br />
						${(informationInstance?.title)}
						... |
						<g:link action="public_show" id="${informationInstance.id}">
							<g:message code="default.detail.label" />
						</g:link>
					</fieldset>
				</g:each>

			</div>

			<div class="paginateButtons">
				<g:paginate total="${informationInstanceTotal}" />
			</div>
		</fieldset>
	</div>
</body>
</html>
