<fieldset class="ui-corner-all">
    <legend>Управление ЛПУ</legend>

    <table>
        <thead class="ui-state-default center">
        <th>Контроллер</th>
        <th colspan="3">Действия</th>
        </thead>
        <tbody>
        <tr>
            <td><g:link controller="LPU" action="list">ЛПУ</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="LPU" action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="LPU" action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="LPU" action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="department" action="list">Подразделения</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="department"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="department"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="department"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="departmentUnit" action="list">Отделения</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="departmentUnit"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="departmentUnit"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="departmentUnit"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="cabinet" action="list">Кабинеты</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="cabinet" action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="cabinet"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="cabinet"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="district" action="list">Территориальные участки</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="district" action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="district"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="district"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="workPlace" action="list">Рабочие места</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="workPlace"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="workPlace"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="workPlace"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="specialist" action="list">Специалисты</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="specialist"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="specialist"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="specialist"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        </tbody>
    </table>
</fieldset>
