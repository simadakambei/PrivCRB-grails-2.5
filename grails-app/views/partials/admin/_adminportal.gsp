<fieldset class="ui-corner-all">

<fieldset class="ui-corner-all">
    <legend>Администратор</legend>
    <table>
        <thead class="ui-state-default center">
        <th>Контроллер</th>
        <th colspan="3">Действия</th>
        </thead>
        <tbody>
        <tr>
            <td><g:link controller="person" action="list">Пользователи</g:link></td>
            <td><g:link controller="person"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="person"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="person"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        <tr>
            <td><g:link controller="authority" action="index">Роли</g:link></td>
            <td><g:link controller="authority"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="authority"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="authority"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        <tr>
            <td><g:link controller="patientInformation" action="list">Информация для пациентов</g:link></td>
            <td><g:link controller="patientInformation"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="patientInformation"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="patientInformation"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        <tr>
            <td><g:link controller="patientInformationType"
                        action="list">Тип информации для пациентов - справочник</g:link></td>
            <td><g:link controller="patientInformationType"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="patientInformationType"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="patientInformationType"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        <tr>
            <td><g:link controller="information" action="list">Объявления и события</g:link></td>
            <td><g:link controller="information"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="information"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="information"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>

        </tbody>
    </table>
</fieldset>
<fieldset class="ui-corner-all">
    <legend>ОМО - статьи, новости, санпросвет работа</legend>
    <table>
        <thead class="ui-state-default center">
        <th>Контроллер</th>
        <th colspan="3">Действия</th>
        </thead>
        <tbody>
        <tr>
            <td><g:link controller="article" action="list">Статьи о медицине</g:link></td>
            <td><g:link controller="article"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="article"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="article"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        <tr>
            <td><g:link controller="news" action="list">Новости медицины</g:link></td>
            <td><g:link controller="news"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="news"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="news"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        <tr>
            <td><g:link controller="health" action="list">Здоровый образ жизни</g:link></td>
            <td><g:link controller="health"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="health"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="health"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        <tr>
            <td><g:link controller="sanprosvet" action="list">Санпросвет работа</g:link></td>
            <td><g:link controller="sanprosvet"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="sanprosvet"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="sanprosvet"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        <tr>
            <td><g:link controller="about" action="list">Описание больницы</g:link></td>
            <td><g:link controller="about"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="about"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="about"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        <tr>
            <td><g:link controller="medicalServize" action="list">Платные услуги</g:link></td>
            <td><g:link controller="medicalServize"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="medicalServize"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="medicalServize"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>

        <tr>
            <td><g:link controller="licenseLPU"
                        action="list">Информация об осуществляемой деятельности (лицензии)</g:link></td>
            <td><g:link controller="licenseLPU"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="licenseLPU"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="licenseLPU"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset class="ui-corner-all">
    <legend>Отдел кадров</legend>
    <table>
        <thead class="ui-state-default center">
        <th>Контроллер</th>
        <th colspan="3">Действия</th>
        </thead>
        <tbody>
        <tr>
            <td><g:link controller="vacancy" action="list">Управление вакансиями</g:link></td>
            <td><g:link controller="vacancy"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="vacancy"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="vacancy"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        </tbody>
    </table>
</fieldset>
<fieldset class="ui-corner-all">
    <legend>Работа с пациентами</legend>
    <table>
        <thead class="ui-state-default center">
        <th>Контроллер</th>
        <th colspan="3">Действия</th>
        </thead>
        <tbody>
        <tr>
            <td><g:link controller="patientResponse" action="list">Отзывы пациентов</g:link></td>
            <td><g:link controller="patientResponse"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="patientResponse"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="patientResponse"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        <tr>
            <td><g:link controller="requestAnAppeal" action="list">Работа с обращениями пациентов</g:link></td>
            <td><g:link controller="requestAnAppeal"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="requestAnAppeal"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="requestAnAppeal"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        <tr>
            <td><g:link controller="answer" action="list">Ответы на вопросы пациентов</g:link></td>
            <td><g:link controller="answer"
                        action="create" title="Добавление"><span class="ui-icon ui-icon-plusthick"></span></g:link></td>
            <td><g:link controller="answer"
                        action="edit_admin" title="Редактирование"><span class="ui-icon ui-icon-pencil"></span></g:link>
            </td>
            <td><g:link controller="answer"
                        action="delete_admin" title="Удаление"><span class="ui-icon ui-icon-minusthick"></span></g:link>
            </td>
        </tr>
        </tbody>
    </table>
</fieldset>
</fieldset>
