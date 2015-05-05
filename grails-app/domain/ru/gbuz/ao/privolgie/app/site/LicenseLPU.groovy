package ru.gbuz.ao.privolgie.app.site


class LicenseLPU {

    String title
    Date dateBegin
    Date dateEnd
    String definition


    static constraints = {
        title(blank: false, nullable: false)
        dateBegin(blank: true, nullable: true)
        dateEnd(blank: true, nullable: true)
        definition(blank: true, nullable: true, size: 0..100000000)
    }

    String toString() {
        title + dateBegin
    }
}
