package ru.gbuz.ao.privolgie.app.entity

import ru.gbuz.ao.privolgie.security.Person

class LPU {

    static hasMany = [departments: Department]

    String title
    String full_title
    String definition
    String addres
    String phone
    String email
    String site
    Person director
    PassportLPU passportLPU
    Double longitude
    Double latitude


    static constraints = {
        title(blank: false, nullable: false)
        full_title(blank: true, nullable: true)
        director(blank: true, nullable: true)
        addres(blank: true, nullable: true, size: 0..2000)
        phone(blank: true, nullable: true)
        email(blank: true, nullable: true)
        site(blank: true, nullable: true)
        definition(blank: true, nullable: true, size: 0..2000)
        passportLPU(blank: true, nullable: true)
        longitude(blank: true, nullable: true)
        latitude(blank: true, nullable: true)
    }

    String toString() {
        title
    }
}
