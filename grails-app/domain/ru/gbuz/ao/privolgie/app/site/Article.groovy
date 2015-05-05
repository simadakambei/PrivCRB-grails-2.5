package ru.gbuz.ao.privolgie.app.site

import ru.gbuz.ao.privolgie.security.Person

class Article {
    static belongsTo = [Person]

    String title
    Date dateCreated
    String content
    Person author
    Boolean mainPage
    Boolean archive
    Boolean medical

    static constraints = {
        title(blank: false, nullable: false)
        dateCreated(blank: true, nullable: true)
        author(blank: true, nullable: true)
        content(blank: true, nullable: true, size: 0..500000)
        mainPage(blank: true, nullable: true)
        archive(blank: true, nullable: true)
        medical(blank: true, nullable: true)
    }

    static mapping = {
        content(type: "text")
    }

    String toString() {
        title
    }
}
