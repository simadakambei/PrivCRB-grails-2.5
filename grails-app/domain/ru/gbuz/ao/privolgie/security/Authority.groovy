package ru.gbuz.ao.privolgie.security

class Authority {

    String authority
    String description

    static mapping = {
        cache true
    }

    static constraints = {
        authority blank: false, unique: true
        description blank: true, nullable: true
    }

    String toString() {
        authority
    }
}
