<%@ page import="ru.gbuz.ao.privolgie.vocs.MedicalServize"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="medicalServize.list" /></title>
</head>

<body>
	<div class="span-24">
		<g:render template="/partials/menu/menumedicalservize" />
		<div class="span-6">
			<g:render template="/partials/sideleft" />
		</div>

		<div>
			<span class="menuButton"><g:link class="create"
					action="create">
					<g:message code="medicalServize.create" />
				</g:link></span>
		</div>
		<div class="list">
			<fieldset class="ui-corner-all">
				<legend>
					<g:message code="medicalServize.list" />
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
								title="${message(code: 'medicalServize.id', default: 'Id')}" />

							<g:sortableColumn property="code"
								title="${message(code: 'medicalServize.code', default: 'Code')}" />

							<g:sortableColumn property="name"
								title="${message(code: 'medicalServize.name', default: 'Name')}" />

							<g:sortableColumn property="cost"
								title="${message(code: 'medicalServize.cost', default: 'Cost')}" />

							<th><g:message code="medicalServize.sectionMedicalCare"
									default="Section Medical Care" /></th>

							<th><g:message code="medicalServize.specialist"
									default="Specialist" /></th>

						</tr>
					</thead>
					<tbody>
						<g:each in="${medicalServizeInstanceList}" status="i"
							var="medicalServizeInstance">
							<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

								<td><g:link action="show" id="${medicalServizeInstance.id}">
										${fieldValue(bean: medicalServizeInstance, field: "id")}
									</g:link></td>

								<td>
									${fieldValue(bean: medicalServizeInstance, field: "code")}
								</td>

								<td>
									${fieldValue(bean: medicalServizeInstance, field: "name")}
								</td>

								<td>
									${fieldValue(bean: medicalServizeInstance, field: "cost")}
								</td>

								<td>
									${fieldValue(bean: medicalServizeInstance, field: "sectionMedicalCare")}
								</td>

								<td>
									${fieldValue(bean: medicalServizeInstance, field: "specialist")}
								</td>

							</tr>
						</g:each>
					</tbody>
				</table>


				<div class="paginateButtons">
					<g:paginate total="${medicalServizeInstanceTotal}" />
				</div>
			</fieldset>
		</div>
	</div>
</body>
</html>
