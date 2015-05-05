package ru.gbuz.ao.privolgie.vocs

import ru.gbuz.ao.privolgie.medical.AnketaDD

class QuestionToAnketa {

    static belongsTo = [AnketaDD]

    String title
    Integer numberQuestion
    Boolean answer

    static constraints = {
        title blank: false, nullable: false
        numberQuestion nullable: true
        answer nullable: true, inList: ["да", "нет"]
    }

    static mapping = {
        title type: 'text'
    }
}
