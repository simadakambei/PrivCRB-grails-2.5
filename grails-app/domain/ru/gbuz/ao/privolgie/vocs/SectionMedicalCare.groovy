package ru.gbuz.ao.privolgie.vocs

import ru.gbuz.ao.privolgie.app.entity.Specialist

/**
 * Раздел медицинской помощи
 */

class SectionMedicalCare {

    static hasMany = [specialists: Specialist, medicalServizes: MedicalServize]

    String name

    static constraints = {
        name(blank: false, nullable: false)
    }

    String toString() {
        name
    }
}
