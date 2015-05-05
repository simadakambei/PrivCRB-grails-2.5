package ru.gbuz.ao.privolgie.vocs

import ru.gbuz.ao.privolgie.app.site.PatientInformation

class PatientInformationType {

    static hasMany = [patientInformations: PatientInformation]

    String name
    String definition
    String code

    static constraints = {
        name(blank: false, nullable: false)
        code(blank: false, nullable: false, unique: true)
        definition(blank: true, nullable: true, size: 0..500)
    }

    String toString() {
        code + ": " + name
    }
}
