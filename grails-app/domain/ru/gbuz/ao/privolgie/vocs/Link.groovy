package ru.gbuz.ao.privolgie.vocs

class Link {

    String name
    URL url
    String definition


    static constraints = {
        name(blank: false, nullable: false)
        url(blank: false, nullable: false)
        definition(blank: true, nullable: true, size: 0..254)
    }

    String toString() {
        name
    }
}
