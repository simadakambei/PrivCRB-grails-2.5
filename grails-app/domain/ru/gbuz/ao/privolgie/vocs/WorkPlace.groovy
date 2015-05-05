package ru.gbuz.ao.privolgie.vocs

import ru.gbuz.ao.privolgie.app.entity.Specialist

class WorkPlace {

    static belongsTo = [Specialist]

    String title
    String definition
    Specialist specialist


    static constraints = {
        title(blank: false, nullable: false)
        definition(blank: true, nullable: true, size: 0..254)
        specialist(blank: true, nullable: true)
    }

    String toString() {
        title
    }
}
