package ru.gbuz.ao.privolgie.app.site

class PatientResponse {

    String patientFIO
    String addres
    Date dateResponse
    String response

    static constraints = {
        patientFIO(blank: false, nullable: false)
        addres(blank: false, nullable: false)
        dateResponse(blank: true, nullable: true)
        response(blank: true, nullable: true)
    }

    static mapping = {
        response(type: 'text')
    }

    String toString() {
        patientFIO
    }
}
