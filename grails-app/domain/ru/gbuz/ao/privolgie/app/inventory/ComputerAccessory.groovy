package ru.gbuz.ao.privolgie.app.inventory

import ru.gbuz.ao.privolgie.vocs.Product
import ru.gbuz.ao.privolgie.vocs.Manufacturer
import ru.gbuz.ao.privolgie.vocs.ComputerAccessoryType

class ComputerAccessory {

    static belongsTo = [SystemUnit]

    Product product
    Manufacturer manufacturer
    ComputerAccessoryType computerAccessoryType
    SystemUnit systemUnit
    String specification

    static constraints = {
        product(blank: false, nullable: false)
        manufacturer(blank: true, nullable: true)
        computerAccessoryType(blank: false, nullable: false)
        systemUnit(blank: true, nullable: true)
        specification(blank: true, nullable: true, size: 0..10000)
    }

    String toString() {
        manufacturer + " : " + product + " : " + computerAccessoryType
    }
}
