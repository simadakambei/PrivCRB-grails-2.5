package ru.gbuz.ao.privolgie.vocs

import ru.gbuz.ao.privolgie.security.Person

class OfficialPost {

    static belongsTo = [Person]

    String title
    String definition
    Person person


    static constraints = {
        title(blank: false, nullable: false)
        person(blank: true, nullable: true)
        definition(blank: true, nullable: true)
    }

    static mapping = {
        definition(type: 'text')
    }

    String toString() {
        title + ": " + person
    }
}
