<%@ page import="ru.gbuz.ao.privolgie.app.site.Article"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="article.list" /></title>
</head>

<body>
	<div class="span-24">
		<g:render template="/partials/menu/menumain" />
		<div class="span-6">
			<g:render template="/partials/sideleft" />
		</div>
		<div class="dialog span-17">
			<fieldset class="ui-corner-all">
				<legend>
					<g:message code="article.list" />
				</legend>
				<g:if test="${flash.message}">
					<div class="message">
						${flash.message}
					</div>
				</g:if>

				<table>
					<thead class="ui-state-default center">
						<tr>

							<g:sortableColumn property="id"
								title="${message(code: 'article.id', default: 'Id')}" />

							<g:sortableColumn property="title"
								title="${message(code: 'article.title', default: 'Title')}" />

							<g:sortableColumn property="dateCreated"
								title="${message(code: 'article.dateCreated', default: 'Date Created')}" />

							<th><g:message code="article.author" default="Author" /></th>

							<g:sortableColumn property="content"
								title="${message(code: 'article.content', default: 'Content')}" />

							<g:sortableColumn property="mainPage"
								title="${message(code: 'article.mainPage', default: 'Main Page')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${articleInstanceList}" status="i"
							var="articleInstance">
							<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

								<td><g:link action="show" id="${articleInstance.id}">
										${fieldValue(bean: articleInstance, field: "id")}
									</g:link></td>

								<td>
									${fieldValue(bean: articleInstance, field: "title")}
								</td>

								<td><g:formatDate format="dd MMMMMMMM yyyy hh:mm"
										date="${articleInstance.dateCreated}" /></td>

								<td>
									${fieldValue(bean: articleInstance, field: "author")}
								</td>

								<td>
									${raw(articleInstance?.content)}
								</td>

								<td><g:formatBoolean boolean="${articleInstance.mainPage}" /></td>

							</tr>
						</g:each>
					</tbody>
				</table>


				<div class="paginateButtons">
					<g:paginate total="${articleInstanceTotal}" />
				</div>
			</fieldset>
		</div>
	</div>
</body>
</html>
