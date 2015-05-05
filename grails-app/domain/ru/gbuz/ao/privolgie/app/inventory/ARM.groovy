package ru.gbuz.ao.privolgie.app.inventory

import ru.gbuz.ao.privolgie.app.entity.DepartmentUnit
import ru.gbuz.ao.privolgie.app.entity.Cabinet
import ru.gbuz.ao.privolgie.app.entity.Specialist
import ru.gbuz.ao.privolgie.vocs.WorkPlace
import ru.gbuz.ao.privolgie.security.Person

class ARM {

    static belongsTo = [Cabinet, Specialist]
    static hasMany = [workPlaces: WorkPlace, externalAccessories: ExternalAccessory]

    String name


    static constraints = {
        name(blank: false, nullable: false)
        externalAccessories(blank: true, nullable: true)
    }

    String toString() {
        name
    }
}
