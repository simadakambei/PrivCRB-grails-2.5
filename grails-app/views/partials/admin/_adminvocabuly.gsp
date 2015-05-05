<fieldset class="ui-corner-all">
    <legend>Управление справочниками</legend>

    <table>
        <thead class="ui-state-default center">
        <th>Контроллер</th>
        <th colspan="3">Действия</th>
        </thead>
        <tbody>

        <tr>
            <td><g:link controller="medicalServize" action="list"><g:message code="medicalServize.list"/></g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="medicalServize"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="medicalServize"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="medicalServize"
                        action="delete_admin">Удаление</g:link></td>
        </tr>

        <tr>
            <td><g:link controller="sectionMedicalCare" action="list"><g:message
                    code="sectionMedicalCare.list"/></g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="sectionMedicalCare"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="sectionMedicalCare"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="sectionMedicalCare"
                        action="delete_admin">Удаление</g:link></td>
        </tr>

        <tr>
            <td><g:link controller="markerCategory" action="list">Категории маркеров</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="markerCategory"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="markerCategory"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="markerCategory"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="speciality" action="list">Список специальностей</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="speciality"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="speciality"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="speciality"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="manufacturer" action="list">Производители</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="typeOwner"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="typeOwner"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="typeOwner"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="project" action="list">Проекты мониторинга</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="project"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="project"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="project"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="producter" action="list">Производитель</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="producter"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="producter"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="producter"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="officialName" action="list">Наименование терминалов</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="officialName"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="officialName"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="officialName"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="specification" action="list">Спецификации оборудования</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="specification"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="specification"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="specification"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="provider" action="list">Провайдеры сотовой связи</g:link></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="provider"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="provider"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="provider"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        </tbody>
    </table>
</fieldset>
