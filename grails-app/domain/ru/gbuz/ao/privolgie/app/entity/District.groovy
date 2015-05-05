package ru.gbuz.ao.privolgie.app.entity

class District {

    static hasMany = [departments: Department]

    String title
    String definition

    static constraints = {
        title(blank: false, nullable: false)
        definition(blank: true, nullable: true)
    }

    String toString() {
        title
    }
}
