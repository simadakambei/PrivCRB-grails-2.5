<%@ page import="ru.gbuz.ao.privolgie.app.site.Vacancy" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="vacancy.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <legend><g:message code="vacancy.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <div class="list">
            <blockquote>Вакансии размещаемые на нашем сайте имеют ограниценный срок актуальности, необходимо контактировать с кадровой службой ЛПУ для уточнения
            </blockquote>

            <h2 class="center">Список вакантных должностей</h2>

            <h3 class="center">ГБУЗ АО "Приволжская РБ"</h3>

            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="specialist"
                                      title="${message(code: 'vacancy.specialist', default: 'Specialist')}"/>

                    <g:sortableColumn property="wageRate"
                                      title="${message(code: 'vacancy.wageRate', default: 'Wage  Rate')}"/>

                    <th><g:message code="vacancy.salary" default="Salary"/></th>

                    <th><g:message code="vacancy.housing" default="Housing"/></th>

                    <th><g:message code="vacancy.definition" default="Definition"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${departmentList}" status="i" var="departmentInstance">
                    <tr class="prop">
                        <td class="value odd" colspan="5"><h4 class="center">${departmentInstance}</h4></td>
                    </tr>
                    <g:each in="${departmentInstance.vacancies}" status="j" var="vacancyInstance">
                        <tr class="prop">
                            <td class="value"><g:link action="public_show"
                                                      id="${vacancyInstance?.id}">${vacancyInstance?.specialist}</g:link></td>
                            <td class="value">${vacancyInstance?.wageRate}</td>
                            <td class="value">${vacancyInstance?.salary} руб.</td>
                            <td class="value"><g:formatBoolean boolean="${vacancyInstance?.housing}"/></td>
                            <td class="value">${vacancyInstance?.definition}</td>
                        </tr>
                    </g:each>
                </g:each>
                </tbody>
            </table>

            <div class="paginateButtons">
                <g:paginate total="${vacancyInstanceTotal}"/>
            </div>
        </div>
    </fieldset>
</div>
</body>
</html>
