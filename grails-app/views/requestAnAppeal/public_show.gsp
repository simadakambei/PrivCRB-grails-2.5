<%@ page import="ru.gbuz.ao.privolgie.app.site.RequestAnAppeal" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="requestAnAppeal.show"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <div>
        <span class="menuButton"><g:link class="list" action="public_list"><g:message
                code="requestAnAppeal.list"/></g:link></span>
    </div>
    <fieldset class="ui-corner-all">
        <legend><g:message code="requestAnAppeal.show"/></legend>
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <fieldset class="ui-corner-all">
            <div class="value">
                <h4 class="ui-state-active otstup-left">${fieldValue(bean: requestAnAppealInstance, field: "requestFIO")}</h4>
                <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${requestAnAppealInstance.requestDate}"/><br/>
                Кому: ${requestAnAppealInstance?.officialPost?.encodeAsHTML()}<br/>
                <hr/>
                <fieldset class="odd">
                    <legend>Текст обращения</legend>
                    ${raw(requestAnAppealInstance?.requestAnAppeal)}
                </fieldset>

                <br/>

                <g:if test="${requestAnAppealInstance.answer != null}">
                    <g:link controller="answerToRequestAnAppeal" action="public_show"
                            id="${requestAnAppealInstance?.answer?.id}"><g:message code="requestAnAppeal.answer"
                                                                                   default="Response To Request"/></g:link>
                </g:if>
                <g:else>
                    <g:message code="requestAnAppeal.answer"
                               default="Response To Request"/>
                </g:else>
                <br/>
                <g:if test="${requestAnAppealInstance.answer != null}">
                    <g:message code="requestAnAppeal.responseToRequest"/>

                    <g:formatDate format="dd MMMMMMMM yyyy hh:mm"
                                  date="${requestAnAppealInstance?.answer?.answerDate}"/>
                    <br/>
                    <g:message code="requestAnAppeal.answered"/> -
                    ${requestAnAppealInstance?.answer?.officialPost}
                </g:if>
                <g:else>
                    <g:message code="requestAnAppeal.notAnswer"/>
                </g:else>
            </div>
        </fieldset>

    </fieldset>
</div>
</body>
</html>
