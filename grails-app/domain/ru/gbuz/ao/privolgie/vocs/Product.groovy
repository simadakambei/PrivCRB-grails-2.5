package ru.gbuz.ao.privolgie.vocs

class Product {

    static belongsTo = [Manufacturer]

    String title
    String specification
    Manufacturer manufacturer

    static constraints = {
        title(blank: false, nullable: false)
        specification(blank: true, nullable: true, size: 0..10000)
        manufacturer(blank: true, nullable: true)
    }

    String toString() {
        title
    }
}
