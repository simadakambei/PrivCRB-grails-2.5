<fieldset class="ui-corner-all">
    <legend class="structural">Управление структурой ЛПУ и персоналом</legend>

    <table>
        <thead class="ui-state-default center">
        <th>Контроллер</th>
        <th>Описание</th>
        <th colspan="3">Действия</th>
        </thead>
        <tbody>
        <tr>
            <td><g:link controller="specialist" action="list">Специалисты</g:link></td>
            <td><p>Справочник наименований специальностей</p></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="specialist"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="specialist"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="specialist"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="LPU" action="list">ЛПУ</g:link></td>
            <td><p>Описание головного ЛПУ</p></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="LPU" action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="LPU"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="LPU"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="department" action="list">Структурные подразделения ЛПУ</g:link></td>
            <td><p>Справочник структурных подразделений ЛПУ</p></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="department"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="department"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="department"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="departmentUnit" action="list">Отделения и службы</g:link></td>
            <td><p>Справочник отделений и служб</p></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="departmentUnit"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="departmentUnit"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="departmentUnit"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="district" action="list">Территориальные участки</g:link></td>
            <td><p>Справочник территориальных участков</p></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="district" action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="district"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="district"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="cabinet" action="list">Кабинеты</g:link></td>
            <td><p>Справочник кабинетов</p></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="cabinet" action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="cabinet"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="cabinet"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="passportLPU" action="list">Паспорта ЛПУ и его подразделений</g:link></td>
            <td><p>Справочник паспортов ЛПУ и его подразделений</p></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="passportLPU"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="passportLPU"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="passportLPU"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        </tbody>
    </table>
</fieldset>