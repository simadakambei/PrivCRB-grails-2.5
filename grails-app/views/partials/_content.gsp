<%@ page import="ru.gbuz.ao.privolgie.app.site.Article; ru.gbuz.ao.privolgie.app.site.News" %>

<fieldset class="ui-corner-all">
    <fieldset class="ui-corner-all" style="padding-top: 10px;">
        <asset:image src="uploads/Image/main.png"/>
    </fieldset>

    <hr/>
    <h2 class="center">НОВОСТИ БОЛЬНИЦЫ</h2>
    <hr/>

    <g:each in="${News.findAllByMainPage(true).reverse()}" var="newsInstance">
        <fieldset class="ui-corner-all span-8 float-right pre-right">
            <div class="value">

                <h4 class="ui-state-active otstup-left">${fieldValue(bean: newsInstance, field: "title")}</h4>

                <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${newsInstance.dateCreated}"/>
                <hr/>

                <div>
                    ${raw(newsInstance?.content?.getAt(0..50))}... | <g:link controller="news"
                                                                             action="public_show"
                                                                             id="${newsInstance?.id}">Подробнее</g:link>
                </div>
            </div>
        </fieldset>
    </g:each>

    <hr/>
    <h2 class="center">СТАТЬИ</h2>
    <hr/>

    <g:each in="${Article.findAllByMedical(true).reverse()}" status="i" var="articleInstance">
        <fieldset class="ui-corner-all span-8 float-left pre-right">
            <div class="value">

                <h4 class="ui-state-active otstup-left">${fieldValue(bean: articleInstance, field: "title")}</h4>

                <g:formatDate format="dd MMMMMMMM yyyy hh:mm" date="${articleInstance.dateCreated}"/>
                <hr/>
                ${raw(articleInstance?.title)} .... | &nbsp;&nbsp;<g:link controller="article"
                                                                          id="${articleInstance.id}"
                                                                          action="public_show"><strong>Подробнее</strong></g:link>
            </div>
        </fieldset>
    </g:each>


</fieldset>

