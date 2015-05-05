package ru.gbuz.ao.privolgie.vocs

class ExternalAccessoryType {

    String title
    String eng_title
    String definition

    static constraints = {
        title(blank: false, nullable: false)
        eng_title(blank: true, nullable: true)
        definition(blank: true, nullable: true, size: 0..254)
    }

    String toString() {
        title
    }
}
