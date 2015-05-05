package ru.gbuz.ao.privolgie.app.site

class Answer {

    static belongsTo = [Question]

    Date dateAnswer
    String answer
    Question question
    String signature

    static constraints = {
        dateAnswer(blank: true, nullable: true)
        answer(blank: false, nullable: false)
        question(blank: false, nullable: false, size: 0..1000)
        signature(blank: false, nullable: false)
    }

    static mapping = {
        answer(type: 'text')
    }

    String toString() {
        dateAnswer + ": " + signature
    }
}
