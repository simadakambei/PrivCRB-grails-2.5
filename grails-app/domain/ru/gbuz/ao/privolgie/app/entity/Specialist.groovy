package ru.gbuz.ao.privolgie.app.entity

import ru.gbuz.ao.privolgie.medical.Patient
import ru.gbuz.ao.privolgie.security.Person
import ru.gbuz.ao.privolgie.vocs.MedicalServize
import ru.gbuz.ao.privolgie.vocs.SectionMedicalCare
import ru.gbuz.ao.privolgie.vocs.Speciality
import ru.gbuz.ao.privolgie.vocs.WorkPlace

class Specialist {

    static belongsTo = [DepartmentUnit, SectionMedicalCare, Speciality]
    static hasMany = [people: Person, workplaces: WorkPlace, specialities: Speciality, medicalServizes: MedicalServize, patients: Patient]

    String name
    String definition
    DepartmentUnit departmentUnit
    SectionMedicalCare sectionMedicalCare
    Speciality specialities
    Patient patients


    static constraints = {
        name(blank: false, nullable: false)
        definition(blank: true, nullable: true, size: 0..500)
        departmentUnit(blank: true, nullable: true)
        sectionMedicalCare(blank: true, nullable: true)
        specialities(blank: true, nullable: true)
        patients(blank: true, nullable: true)
    }

    String toString() {
        name
    }
}
