<%@ page import="ru.gbuz.ao.privolgie.app.entity.Department"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="department.show" /></title>
</head>

<body>
	<div class="span-24">
		<g:render template="/partials/menu/menumain" />
		<div class="span-6">
			<g:render template="/partials/sideleft" />
		</div>

		<div>
			<span class="menuButton"><g:link class="list" action="list">
					<g:message code="department.list" />
				</g:link></span> <span class="menuButton"><g:link class="create"
					action="create">
					<g:message code="department.new" />
				</g:link></span>
		</div>

		<div class="dialog">
			<fieldset class="ui-corner-all">
				<legend>
					<g:message code="department.show" />
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
									code="department.id" default="Id" /></td>

							<td valign="top" class="value">
								${fieldValue(bean: departmentInstance, field: "id")}
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.title" default="Title" /></td>

							<td valign="top" class="value">
								${fieldValue(bean: departmentInstance, field: "title")}
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.director" default="Director" /></td>

							<td valign="top" class="value"><g:link controller="person"
									action="show" id="${departmentInstance?.director?.id}">
									${departmentInstance?.director?.encodeAsHTML()}
								</g:link></td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.addres" default="Addres" /></td>

							<td valign="top" class="value">
								${fieldValue(bean: departmentInstance, field: "addres")}
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.transport" default="Transport" /></td>

							<td valign="top" class="value">
								${fieldValue(bean: departmentInstance, field: "transport")}
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.phone" default="Phone" /></td>

							<td valign="top" class="value">
								${fieldValue(bean: departmentInstance, field: "phone")}
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.email" default="Email" /></td>

							<td valign="top" class="value">
								${fieldValue(bean: departmentInstance, field: "email")}
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.definition" default="Definition" /></td>

							<td valign="top" class="value">
								${fieldValue(bean: departmentInstance, field: "definition")}
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.passportLPU" default="Passport LPU" /></td>

							<td valign="top" class="value"><g:link
									controller="passportLPU" action="show"
									id="${departmentInstance?.passportLPU?.id}">
									${departmentInstance?.passportLPU?.encodeAsHTML()}
								</g:link></td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.lpu" default="Lpu" /></td>

							<td valign="top" class="value"><g:link controller="LPU"
									action="show" id="${departmentInstance?.lpu?.id}">
									${departmentInstance?.lpu?.encodeAsHTML()}
								</g:link></td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.district" default="District" /></td>

							<td valign="top" class="value"><g:link controller="district"
									action="show" id="${departmentInstance?.district?.id}">
									${departmentInstance?.district?.encodeAsHTML()}
								</g:link></td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.longitude" default="Longitude" /></td>

							<td valign="top" class="value">
								${fieldValue(bean: departmentInstance, field: "longitude")}
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.latitude" default="Latitude" /></td>

							<td valign="top" class="value">
								${fieldValue(bean: departmentInstance, field: "latitude")}
							</td>

						</tr>

						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="department.units" default="Units" /></td>

							<td valign="top" style="text-align: left;" class="value">
								<ul>
									<g:each in="${departmentInstance.units}" var="u">
										<li><g:link controller="departmentUnit" action="show"
												id="${u.id}">
												${u?.encodeAsHTML()}
											</g:link></li>
									</g:each>
								</ul>
							</td>

						</tr>

					</tbody>
				</table>


				<div class="buttons">
					<g:form>
						<g:hiddenField name="id" value="${departmentInstance?.id}" />
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
