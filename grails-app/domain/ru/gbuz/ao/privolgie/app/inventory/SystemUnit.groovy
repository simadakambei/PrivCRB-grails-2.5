package ru.gbuz.ao.privolgie.app.inventory

import ru.gbuz.ao.privolgie.app.entity.Cabinet

class SystemUnit {

    static hasMany = [accessories: ComputerAccessory]
    static belongsTo = [Cabinet]

    String title
    String inventNumber
    String definition
    Boolean stickerWindows
    Cabinet cabinet

    static constraints = {
        title(blank: false, nullable: false)
        inventNumber(blank: true, nullable: true, unique: true)
        definition(blank: true, nullable: true, size: 0..255)
        cabinet(blank: true, nullable: true)
        stickerWindows(blank: true, nullable: true)
    }

    String toString() {
        title + ": " + inventNumber + ": " + cabinet?.number
    }

}
