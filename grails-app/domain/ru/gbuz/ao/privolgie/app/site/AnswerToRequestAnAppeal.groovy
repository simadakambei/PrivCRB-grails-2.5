package ru.gbuz.ao.privolgie.app.site

import ru.gbuz.ao.privolgie.vocs.OfficialPost

class AnswerToRequestAnAppeal {

    static belongsTo = [RequestAnAppeal, OfficialPost]

    Date answerDate
    RequestAnAppeal requestAnAppeal
    OfficialPost officialPost
    String answer

    static constraints = {
        answerDate(blank: true, nullable: true)
        requestAnAppeal(blank: false, nullable: false)
        officialPost(blank: true, nullable: true)
        answer(blank: true, nullable: true, size: 0..500)
    }

    static mapping = {
        answer(type: 'text')
//        requestAnAppeal(cascade: 'answer')
    }

    String ToString() {
        answerDate + ": " + requestAnAppeal
    }
}
