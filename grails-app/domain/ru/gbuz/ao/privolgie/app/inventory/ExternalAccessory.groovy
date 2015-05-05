package ru.gbuz.ao.privolgie.app.inventory

import ru.gbuz.ao.privolgie.vocs.Product
import ru.gbuz.ao.privolgie.vocs.ExternalAccessoryType

/**
 * Сущность для подключаемых устройств на АРМ ( вне системного блока)
 */

class ExternalAccessory {

    static belongsTo = [ARM]

    Product product
    ExternalAccessoryType externalAccessoryType
    String inventNumber
    ARM arm

    static constraints = {
        product(blank: false, nullable: false)
        externalAccessoryType(blank: false, nullable: false)
        inventNumber(blank: true, nullable: true)
        arm(blank: true, nullable: true)
    }

    String toString() {
        externalAccessoryType + " : " + product + " : " + arm
    }
}
