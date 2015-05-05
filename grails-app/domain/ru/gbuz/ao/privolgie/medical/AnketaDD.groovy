package ru.gbuz.ao.privolgie.medical

import ru.gbuz.ao.privolgie.app.entity.Specialist
import ru.gbuz.ao.privolgie.vocs.QuestionToAnketa

class AnketaDD {

    static hasMany = [questions: QuestionToAnketa]
    static belongsTo = [Specialist]

    String title
    Date anketingDate
    Specialist specialist



    static constraints = {
        title blank: false, nullable: false
        questions nullable: true
    }

    static mapping = {
        title type: 'text'
    }
}
