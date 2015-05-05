package ru.gbuz.ao.privolgie.app.entity

import ru.gbuz.ao.privolgie.vocs.WorkPlace

class Cabinet {
    static belongsTo = [DepartmentUnit]
    static hasMany = [workplaces: WorkPlace, specialists: Specialist]

    String title
    Integer number
    String definition
    DepartmentUnit unit

    static constraints = {
        title(blank: false, nullable: false)
        number(blank: true, nullable: true)
        definition(blank: true, nullable: true, size: 0..254)
        unit(blank: true, nullable: true)
    }

    String toString() {
        title + ": " + number + ": " + unit.title
    }
}
