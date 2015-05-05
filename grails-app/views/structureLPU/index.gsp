<%@ page import="ru.gbuz.ao.privolgie.app.entity.LPU"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="default.welcome.label" /></title>
<asset:javascript src="noConflict.js" />
<asset:javascript src="map/prototype.js" />
<asset:javascript src="openlayers/OpenLayers.js" />
<asset:javascript
	src="openlayers/lib/OpenLayers/Control/LayerSwitcher.js" />
<asset:javascript src="map/structurelpu.js" />
<asset:javascript src="map/json-minified.js" />
<asset:javascript src="noConflict.js" />
</head>

<body>
	<div class="span-24">
		<g:render template="/partials/menu/menustructure" />
		<div class="span-6">
			<g:render template="/partials/sideleft" />
		</div>
		<div class="dialog">
			<crumbs:trail selector="title" />
			<br />
			<fieldset class="ui-corner-all">
				<legend class="structure">
					<g:message code="default.welcome.label" />
				</legend>



				<div class="center">
					<g:link class="lpu" controller="LPU" action="public_show"
						id="${lpu.id}">
						${lpu}
					</g:link>
				</div>

				<div id="structureline" class="span-17 center">
					<center>
						<img class="center-img"
							src="${createLinkTo(dir: 'images', file: 'structureline2.png')}" />
					</center>
				</div>

				<div class="span-17">
					<fieldset id="district_1"
						class="span-5 ui-corner-all center head_gbuz">
						<h6>
							${d1}
						</h6>
						<hr />
						<g:each
							in="${ru.gbuz.ao.privolgie.app.entity.Department.findAllByDistrict(d1)}"
							status="i" var="d">
							<g:link controller="department" action="public_show"
								id="${d?.id}" target="self">
								${d?.title}
							</g:link>
							<br />
							<g:if test="${d.units}">
								<ul>
									<g:each in="${d.units}" var="u">
										<li><g:link controller="departmentUnit"
												action="public_show" id="${u?.id}" target="self">
												${u?.title}
											</g:link></li>
									</g:each>
								</ul>
							</g:if>
						</g:each>
					</fieldset>
					<fieldset id="head_gbuz"
						class="span-5 ui-corner-all center head_gbuz">
						<g:each
							in="${ru.gbuz.ao.privolgie.app.entity.Department.findAllWhere(district: null)}"
							status="i" var="d">
							<g:link controller="department" action="public_show"
								id="${d?.id}" target="self">
								${d}
							</g:link>
							<g:if test="${d.units}">
								<ul>
									<g:each in="${d.units}" var="u">
										<li><g:link controller="departmentUnit"
												action="public_show" id="${u?.id}" target="self">
												${u?.title}
											</g:link></li>
									</g:each>
								</ul>
							</g:if>
						</g:each>
					</fieldset>
					<fieldset id="district_2"
						class="span-5 ui-corner-all center head_gbuz">
						<h6>
							${d2}
						</h6>
						<hr />
						<g:each
							in="${ru.gbuz.ao.privolgie.app.entity.Department.findAllByDistrict(d2)}"
							status="i" var="d">
							<g:link controller="department" action="public_show"
								id="${d?.id}" target="self">
								${d?.title}
							</g:link>
							<br />
							<g:if test="${d.units}">
								<ul>
									<g:each in="${d.units}" var="u">
										<li><g:link controller="departmentUnit"
												action="public_show" id="${u?.id}" target="self">
												${u?.title}
											</g:link></li>
									</g:each>
								</ul>
							</g:if>
						</g:each>
					</fieldset>

				</div>

				<div id="map" class="span-17"></div>
		</div>

		</fieldset>
	</div>
</body>
</html>
