package ru.gbuz.ao.privolgie.vocs

import ru.gbuz.ao.privolgie.app.entity.LPU

class Requisite {

    static belongsTo = [LPU]

    String title

    static constraints = {
    }
}
