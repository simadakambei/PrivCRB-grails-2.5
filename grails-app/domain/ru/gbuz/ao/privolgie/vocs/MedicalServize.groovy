package ru.gbuz.ao.privolgie.vocs

import ru.gbuz.ao.privolgie.app.entity.Specialist

class MedicalServize {
    static belongsTo = [SectionMedicalCare, Specialist]

    String code
    String name
    String cost
    SectionMedicalCare sectionMedicalCare
    Specialist specialist
    String definition
    Boolean actuality

    static constraints = {
        code(blank: false, nullable: false)
        name(blank: false, nullable: false)
        cost(blank: true, nullable: true)
        sectionMedicalCare(blank: true, nullable: true)
        specialist(blank: true, nullable: true)
        definition(blank: true, nullable: true)
        actuality(blank: true, nullable: true)
    }

    static mapping = {
        order "asc"
    }

    String toString() {
        code + ": " + name
    }
}
