<div id="accordition" class="small" xmlns="http://www.w3.org/1999/html">
    <h3><a href="#"><g:message code="login.in"/></a></h3>

    <div>
        <sec:ifNotLoggedIn>
            <div class="buttons button_in_div_last"><g:link class="for_personnel" controller="login">
                <g:message code="login.in"/>
            </g:link></div>

            <p>
                Информация и разделы только для сотрудников ЛПУ
            </p>
        </sec:ifNotLoggedIn>
        <sec:ifLoggedIn>
            <h7 class="auth"><g:message code="auth.hi"/></h7> <strong><sec:username/></strong>
            <h7 class="auth">|</h7>
            <g:link controller="logout" action="index">
                <g:message code="logout.out"/>
            </g:link>
        </sec:ifLoggedIn>
    </div>

    <h3><a href="#"><g:message code="gbuz.news.label"/></a></h3>

    <div>
        <div class="buttons button_in_div_last"><g:link class="news" controller="news" action="public_list">
            <g:message code="gbuz.news.label"/>
        </g:link></div>

        <p>
            Новости российского о астраханского здравоохранения, а также события,
            связанные со здоровьем человека.
        </p>
    </div>

    <h3><a href="#"><g:message code="gbuz.vacancy.label"/></a></h3>

    <div>
        <div class="buttons button_in_div_last"><g:link class="vacancy" controller="vacancy" action="public_list">
            <g:message code="gbuz.vacancy.label"/>
        </g:link></div>

        <p>
            Список вакансий для работы в ГБУЗ АО 'Приволжская РБ'.
        </p>

    </div>

    <h3><a href="#"><g:message code="gbuz.article.label"/></a></h3>

    <div>
        <div class="buttons button_in_div_last"><g:link class="medbiblio" controller="article" action="medical_list">
            <g:message code="gbuz.article.label"/>
        </g:link></div>

        <p>
            Статьи и полезные материалы о медицине, посвящённые новым
            методам лечения, новым лекарственным средствам, вопросам материнства
            и детства
        </p>
    </div>

    <h3><a href="#"><g:message code="gbuz.health.label"/></a></h3>

    <div>
        <div class="buttons button_in_div_last"><g:link class="health" controller="health" action="public_list">
            <g:message code="gbuz.health.label"/>
        </g:link></div>

        <p>
            Раздел, посвящённый здоровому образу жизни, спорту. Рекомендации специалистов
        </p>
    </div>

    <h3><a href="#"><g:message code="gbuz.sanprosvet.label"/></a></h3>

    <div>
        <div class="buttons button_in_div_last"><g:link class="sanprosvet " controller="sanprosvet" action="public_list">
            <g:message code="gbuz.sanprosvet.label"/>
        </g:link></div>

        <p>
            Чрезвычайно важный раздел нашего сайта, посвящённый вопросам личной и общественной гигиены,
            вопросам профилактики различных заболеваний, ответам на наиболее важные и значимые вопросы
            по сохранению Вашего здоровья, а также здоровья Ваших родных и близких
        </p>
    </div>

</div>

<div class="ui-widget">
    <div class="ui-widget-header ui-helper-reset ui-corner-top center">
        <g:message code="gbuz.links.for.medical.resources"/>
    </div>

    <div class="ui-widget-content ui-corner-bottom small">
        <br/>
        <g:each in="${ru.gbuz.ao.privolgie.vocs.Link.listOrderById()}" var="linkInstance">
            <div class="buttons button_in_div_last"><g:link class="links" url="${linkInstance.url}" target="_blank"
                                                            title="${linkInstance?.definition}">${linkInstance?.definition}</g:link></div>
        </g:each>
    </div>
</div>

<div class="ui-widget">
    <div class="ui-widget-header ui-helper-reset ui-corner-top center">
        <g:message code="gbuz.backlinks.for.patients"/>
    </div>

    <div class="ui-widget-content ui-corner-bottom small">
        <br/>

        <div class="buttons button_in_div_last"><g:link class="patient_response" controller="patientResponse"
                                                        action="public_list"><g:message
                    code="patientResponse.public.list"/></g:link></div>

        <div class="buttons button_in_div_last"><g:link class="patient_response" controller="requestAnAppeal"
                                                        action="public_list"><g:message
                    code="requestAnAppeal.public.list"/></g:link></div>

        <div class="buttons button_in_div_last"><g:link class="patient_response" controller="question"
                                                        action="public_list"><g:message
                    code="question.welcome"/></g:link></div>

    </div>
</div>