<%@ page import="ru.gbuz.ao.privolgie.app.entity.Specialist" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="specialist.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="list"><g:message code="specialist.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="specialist.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="specialist.id"
                                                             default="Id"/></td>

                    <td valign="top" class="value">${fieldValue(bean: specialistInstance, field: "id")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="specialist.name"
                                                             default="Name"/></td>

                    <td valign="top" class="value">${fieldValue(bean: specialistInstance, field: "name")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="specialist.definition"
                                                             default="Definition"/></td>

                    <td valign="top" class="value">${fieldValue(bean: specialistInstance, field: "definition")}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="specialist.departmentUnit"
                                                             default="Department Unit"/></td>

                    <td valign="top" class="value"><g:link controller="departmentUnit"
                                                           action="show"
                                                           id="${specialistInstance?.departmentUnit?.id}">${specialistInstance?.departmentUnit?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="specialist.sectionMedicalCare"
                                                             default="Section Medical Care"/></td>

                    <td valign="top" class="value"><g:link controller="sectionMedicalCare"
                                                           action="show"
                                                           id="${specialistInstance?.sectionMedicalCare?.id}">${specialistInstance?.sectionMedicalCare?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="specialist.specialities"
                                                             default="Specialities"/></td>

                    <td valign="top" class="value"><g:link controller="speciality"
                                                           action="show"
                                                           id="${specialistInstance?.specialities?.id}">${specialistInstance?.specialities?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="specialist.medicalServizes"
                                                             default="Medical Servizes"/></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${specialistInstance.medicalServizes}" var="m">
                                <li><g:link controller="medicalServize" action="show"
                                            id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="specialist.people"
                                                             default="People"/></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${specialistInstance.people}" var="p">
                                <li><g:link controller="person" action="show"
                                            id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"><g:message code="specialist.workplaces"
                                                             default="Workplaces"/></td>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${specialistInstance.workplaces}" var="w">
                                <li><g:link controller="workPlace" action="show"
                                            id="${w.id}">${w?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                </tbody>
            </table>
        </div>
    </fieldset>
</div>
</body>
</html>
