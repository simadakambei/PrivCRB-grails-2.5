<%@ page import="ru.gbuz.ao.privolgie.vocs.MedicalServize" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="medicalServize.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumedicalservize"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <legend><g:message code="medicalServize.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">

            <blockquote>Платные услуги предоставляются в соответствии с Постановлением Правительства РФ от 04.10.2012 № 1006
            "Об утверждении правил предоставления медицинскими организациями платных медицинских услуг".
            </blockquote>

            <h2 class="center">ПРЕЙСКУРАНТ</h2>

            <h3 class="center">на медицинские услуги, оказываемые ГБУЗ АО "Приволжская РБ"</h3>

            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="code"
                                      title="${message(code: 'medicalServize.code', default: 'Code')}"/>

                    <g:sortableColumn property="name"
                                      title="${message(code: 'medicalServize.name', default: 'Name')}"/>

                    <th><g:message code="medicalServize.cost" default="Cost"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${sectionMedicalCareList.sort()}" status="i" var="sectionMedicalCareInstance">
                    <tr>
                        <td colspan="3" class="center"><strong>${sectionMedicalCareInstance?.name}</strong></td>
                    </tr>
                    <g:each in="${sectionMedicalCareInstance.specialists.sort()}" status="j" var="specialist">
                        <tr>
                            <td colspan="3" class="center"><strong>${specialist?.name}</strong></td>
                        </tr>
                        <g:findAll in="${specialist.medicalServizes}" expr="it">
                            <tr>
                                <td class="center">${it.code}</td>
                                <td class="center">${it.name}</td>
                                <td class="center">${it.cost}</td>
                            </tr>
                        </g:findAll>
                    </g:each>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${medicalServizeInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
