package ru.gbuz.ao.privolgie.app.site

/**
 * Сущность на странице описывающая больницу
 */

class About {

    String title
    String content
    Boolean visible

    static constraints = {
        title(blank: false, nullable: false)
        content(blank: true, nullable: true, size: 0..10000)
        visible(blank: true, nullable: true)
    }

    String toString() {
        title
    }
}
