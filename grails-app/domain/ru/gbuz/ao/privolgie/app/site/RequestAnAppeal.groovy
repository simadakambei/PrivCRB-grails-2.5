package ru.gbuz.ao.privolgie.app.site

import ru.gbuz.ao.privolgie.vocs.OfficialPost

class RequestAnAppeal {

    static hasOne = [answer: AnswerToRequestAnAppeal]

    String requestFIO
    String requestAddres
    String phone
    String email
    String requestAnAppeal
    OfficialPost officialPost
    Date requestDate
    AnswerToRequestAnAppeal answer

    static mapping = {
        requestAnAppeal(type: 'text')
        requestAddres(type: 'text')
        requestDate(default: new Date().toTimestamp())
    }

    static constraints = {
        requestFIO(blank: false, nullable: false)
        requestAddres(blank: false, nullable: false)
        phone(blank: false, nullable: false)
        email(blank: true, nullable: true, email: true)
        requestDate(blank: true, nullable: true)
        officialPost(blank: true, nullable: true)
        answer(blank: true, nullable: true)
    }

    String toString() {
        requestFIO
    }
}
