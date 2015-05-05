package ru.gbuz.ao.privolgie.app.site

import ru.gbuz.ao.privolgie.security.Person

class Sanprosvet {
    static belongsTo = [Person]

    String title
    Date dateCreated
    String content
    Person author
    Boolean archive

    static constraints = {
        title(blank: false, nullable: false)
        dateCreated(blank: true, nullable: true)
        author(blank: true, nullable: true)
        content(blank: true, nullable: true, size: 0..2000000)
        archive(blank: true, nullable: true)
    }

    static mapping = {
        content(type: "text")
    }

    String toString() {
        title
    }
}
