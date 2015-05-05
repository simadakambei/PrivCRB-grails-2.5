package ru.gbuz.ao.privolgie.app.site

import ru.gbuz.ao.privolgie.vocs.PatientInformationType

class PatientInformation {

    static belongsTo = [PatientInformationType]

    String title
    Date dateInfo
    String content
    Boolean visible
    PatientInformationType patientInformationType


    static constraints = {
        title(blank: false, nullable: false)
        dateInfo(blank: true, nullable: true)
        patientInformationType(blank: true, nullable: true)
        content(blank: true, nullable: true, size: 0..100000)
        visible(blank: true, nullable: true)
    }
	
	static mapping = {
		content(type: 'text')
	}

    String toString() {
        title
    }
}
