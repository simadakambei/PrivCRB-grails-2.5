package ru.gbuz.ao.privolgie.security

import ru.gbuz.ao.privolgie.app.site.News

class Person {

//    static  hasMany = [news: News]

    transient springSecurityService

    String username
    String fullname
    String password
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static transients = ['springSecurityService']

    static constraints = {
        username blank: false, unique: true
        fullname blank: false, nullable: false
        password blank: false
    }

    static mapping = {
        password column: '`password`'
    }

    Set<Authority> getAuthorities() {
        PersonAuthority.findAllByPerson(this).collect { it.authority }
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    String toString() {
        fullname
    }
}
