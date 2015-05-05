package ru.gbuz.ao.privolgie.manage

class AdministrationController {

    def index = {
        render(view: 'index')
    }

    def adminportal = {
        render(view: '../administration/portal')
    }

    def adminlpu = {
        render(view: '../administration/lpu')
    }

    def adminapplication = {
        render(view: '../administration/application')
    }

    def adminvocabuly = {
        render(view: '../administration/vocabuly')
    }
}
