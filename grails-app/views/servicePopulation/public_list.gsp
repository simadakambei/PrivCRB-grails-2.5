<%@ page import="ru.gbuz.ao.privolgie.vocs.ServicePopulation" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="servicePopulation.list"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menupatientinformation"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <legend><g:message code="servicePopulation.list"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
         

        <div class="list">
            <blockquote>
                <p>
                    Согласно "Общероссийскому классификатору услуг населению",
                    утвержденному постановлением Госстандарта России от 28 июня 1993 г.,
                    медицинская деятельность отнесена к разряду "услуги"
                    (разд. 08 "медицинские услуги"), включая, в частности, постановку диагноза,
                    консультации и лечение врачами-специалистами, услуги скорой медицинской
                    помощи и т.д.
                </p>

                <p>
                    В соответствии с этим ГБУЗ АО 'Приволжская ЦРБ' предоставляет список медицинских
                    услуг, оказываемых учреждением прикреплённому населению в соответствии с
                    территориальной программой ОМС текущего года.
                </p>
            </blockquote>
            <table>
                <thead class="ui-state-default center">
                <tr>

                    <g:sortableColumn property="title"
                                      title="${message(code: 'servicePopulation.title', default: 'Title')}"/>

                    <g:sortableColumn property="description"
                                      title="${message(code: 'servicePopulation.description', default: 'Description')}"/>

                </tr>
                </thead>
                <tbody>
                <g:each in="${servicePopulationInstanceList}" status="i" var="servicePopulationInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                        <td><g:link action="show"
                                    id="${servicePopulationInstance.id}">${fieldValue(bean: servicePopulationInstance, field: "title")}</g:link></td>

                        <td>${fieldValue(bean: servicePopulationInstance, field: "description")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>

        <div class="paginateButtons">
            <g:paginate total="${servicePopulationInstanceTotal}"/>
        </div>
    </fieldset>
</div>
</body>
</html>
