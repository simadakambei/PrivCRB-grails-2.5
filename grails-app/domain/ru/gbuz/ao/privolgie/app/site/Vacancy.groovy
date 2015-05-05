package ru.gbuz.ao.privolgie.app.site

import ru.gbuz.ao.privolgie.app.entity.Department
import ru.gbuz.ao.privolgie.app.entity.DepartmentUnit
import ru.gbuz.ao.privolgie.app.entity.Specialist
import ru.gbuz.ao.privolgie.vocs.Speciality

class Vacancy {

    static belongsTo = [Department]

    Department department
    DepartmentUnit departmentUnit
    Speciality speciality
    Specialist specialist
    Float wageRate
    Float salary
    Float salatymin
    Float salarymax
    Boolean housing
    String definition


    static constraints = {
        specialist(blank: false, nullable: false)
        speciality(blank: false, nullable: false)
        department(blank: false, nullable: false)
        departmentUnit(blank: true, nullable: true)
        wageRate(blank: false, nullable: false)
        salary(blank: true, nullable: true, scale: 2)
        salatymin(blank: true, nullable: true)
        salarymax(blank: true, nullable: true)
        housing(blank: true, nullable: true)
        definition(blank: true, nullable: true, size: 0..1000)
    }

    String toString() {
        specialist
    }
}
