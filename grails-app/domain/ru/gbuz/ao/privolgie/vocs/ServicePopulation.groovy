package ru.gbuz.ao.privolgie.vocs

class ServicePopulation {

    String title
    String description
    String medcode
    Boolean working
    Boolean onsite

    static constraints = {
        title(blank: false, nullable: false)
        description(blank: true, nullable: true, size: 0..254)
        medcode(blank: true, nullable: true)
        working(blank: true, nullable: true)
        onsite(blank: true, nullable: true)
    }

    String toString() {
        title
    }
}
