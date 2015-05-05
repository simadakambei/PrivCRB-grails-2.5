package ru.gbuz.ao.privolgie.app.site

class Question {

    static hasMany = [answers: Answer]

    String FIO
    String question
    Date dateQuestion

    static constraints = {
        FIO(blank: false, nullable: false)
        question(blank: false, nullable: false, size: 0..500)
        dateQuestion(blank: true, nullable: true)
    }

    static mapping = {
        question(type: 'text')
    }

    String toString() {
        FIO
    }
}
