package ru.gbuz.ao.privolgie.medical

class Patient {

    static hasMany = [ankets: AnketaDD]

    String lastName
    String firstName
    String middleName
    Date birthday
    String spolis
    String npolis
    String smo
    String gender
    String codeAccount
    String addres


    static constraints = {
        lastName blank: false, nullable: false
        firstName blank: false, nullable: false
        middleName blank: true, nullable: true
        gender blank: false, inList: ["м", "ж"]
        birthday blank: true, nullable: true
        spolis blank: true, nullable: true
        npolis blank: true, nullable: true
        smo blank: true, nullable: true
        codeAccount blank: true, nullable: true
        addres blank: true, nullable: true
    }

    String ToString() {
        lastName + " " + firstName
    }
}
