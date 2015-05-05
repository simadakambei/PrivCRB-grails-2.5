package ru.gbuz.ao.privolgie.app.site

class Information {

    String title
    Date dateinfo
    String content
    Boolean visible

    static constraints = {
        title(blank: false, nullable: false)
        dateinfo(blank: true, nullable: true)
        content(blank: true, nullable: true, size: 0..1000000)
        visible(blank: true, nullable: true)
    }
	
	static mapping = {
		content(type: "text")
	}
}
