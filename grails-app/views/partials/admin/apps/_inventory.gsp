<fieldset class="ui-corner-all">
    <legend class="inventory">Управление инвентаризацией</legend>

    <table>
        <thead class="ui-state-default center">
        <th>Контроллер</th>
        <th>Описание</th>
        <th colspan="3">Действия</th>
        </thead>
        <tbody>
        <tr>
            <td><g:link controller="computerAccessoryType"
                        action="list">Тип компьютерного оборудования (справочник)</g:link></td>
            <td><p>Справочник типов устройств, которые устанавливаются внутри системного блока. Описывается просто как сущность, например, видео карта, жесткий диск и т.д.</p>
            </td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="computerAccessoryType"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="computerAccessoryType"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="computerAccessoryType"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="externalAccessoryType"
                        action="list">Тип внешнего компьютерного оборудования (справочник)</g:link></td>
            <td><p>Справочник типов устройств, которые устанавливаются вне системного блока. Описывается просто как сущность, например, клавиатура, монитор и т.д.</p>
            </td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="externalAccessoryType"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="externalAccessoryType"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="externalAccessoryType"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="externalAccessory" action="list">Внешние компьютерные устройства</g:link></td>
            <td><p>Внешнее компьютерное оборудование, которые может иметь инвентарный номер, например, планшетный компьютер iPad 2 с инвентарным номером таким то, спецификация такая то, кабинет такой то.</p>
            </td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="externalAccessory"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="externalAccessory"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="externalAccessory"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="computerAccessory" action="list">Внутренние компьютерные устройства</g:link></td>
            <td><p>Компьютерное оборудование, которое устанавливается в системный блок, например, материнская плата, оперативная память</p>
            </td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="computerAccessory"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="computerAccessory"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="computerAccessory"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="product" action="list">Компьютерные устройства (справочник)</g:link></td>
            <td><p>Справочник торговых наименований компьютерного оборудования, например, оптическая мышь NX-200</p>
            </td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="product" action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="product"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="product"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="manufacturer" action="list"><g:message
                    code="manufacturer.admin"/> (справочник)</g:link></td>
            <td><p>Справочник производителей компьютерного оборудования, например, LG, Samsung, Seagate</p></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="manufacturere"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="manufacturer"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="manufacturer"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="systemUnit" action="list">Системные блоки в сборе</g:link></td>
            <td><p>Системные блоки в сборе. Относятся к АРМ и специалистам, которые их используют в работе</p></td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="systemUnit"
                        action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="systemUnit"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="systemUnit"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        <tr>
            <td><g:link controller="ARM" action="list">Автоматизированные рабочие места (АРМ)</g:link></td>
            <td><p>Автоматизированные рабочие места (АРМ), состоят из монитора, системного блока или терминала, мышь, клавиатура, могут быть дополнительные устройства, например, принтер, сканер</p>
            </td>
            <td><g:link class="ui-icon ui-icon-plusthick" controller="ARM" action="create">Добавление</g:link></td>
            <td><g:link class="ui-icon ui-icon-pencil" controller="ARM"
                        action="edit_admin">Редактирование</g:link></td>
            <td><g:link class="ui-icon ui-icon-minusthick" controller="ARM"
                        action="delete_admin">Удаление</g:link></td>
        </tr>
        </tbody>
    </table>
</fieldset>