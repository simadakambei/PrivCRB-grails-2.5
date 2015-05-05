package ru.gbuz.ao.privolgie.app.site

import ru.gbuz.ao.privolgie.app.entity.Department

class VacancyController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [vacancyInstanceList: Vacancy.list(params), vacancyInstanceTotal: Vacancy.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def departmentList = Department.list(sort: "title")
        [vacancyInstanceList: Vacancy.list(params), vacancyInstanceTotal: Vacancy.count(), departmentList: Department.list(sort: "title")]
    }

    def create = {
        def vacancyInstance = new Vacancy()
        vacancyInstance.properties = params
        return [vacancyInstance: vacancyInstance]
    }

    def save = {
        def vacancyInstance = new Vacancy(params)
        if (!vacancyInstance.hasErrors() && vacancyInstance.save()) {
            flash.message = "vacancy.created"
            flash.args = [vacancyInstance.id]
            flash.defaultMessage = "Vacancy ${vacancyInstance.id} created"
            redirect(action: "show", id: vacancyInstance.id)
        } else {
            render(view: "create", model: [vacancyInstance: vacancyInstance])
        }
    }

    def show = {
        def vacancyInstance = Vacancy.get(params.id)
        if (!vacancyInstance) {
            flash.message = "vacancy.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Vacancy not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [vacancyInstance: vacancyInstance]
        }
    }

    def public_show = {
        def vacancyInstance = Vacancy.get(params.id)
        if (!vacancyInstance) {
            flash.message = "vacancy.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Vacancy not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [vacancyInstance: vacancyInstance]
        }
    }

    def edit = {
        def vacancyInstance = Vacancy.get(params.id)
        if (!vacancyInstance) {
            flash.message = "vacancy.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Vacancy not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [vacancyInstance: vacancyInstance]
        }
    }

    def update = {
        def vacancyInstance = Vacancy.get(params.id)
        if (vacancyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (vacancyInstance.version > version) {

                    vacancyInstance.errors.rejectValue("version", "vacancy.optimistic.locking.failure", "Another user has updated this Vacancy while you were editing")
                    render(view: "edit", model: [vacancyInstance: vacancyInstance])
                    return
                }
            }
            vacancyInstance.properties = params
            if (!vacancyInstance.hasErrors() && vacancyInstance.save()) {
                flash.message = "vacancy.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Vacancy ${params.id} updated"
                redirect(action: "show", id: vacancyInstance.id)
            } else {
                render(view: "edit", model: [vacancyInstance: vacancyInstance])
            }
        } else {
            flash.message = "vacancy.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Vacancy not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def vacancyInstance = Vacancy.get(params.id)
        if (vacancyInstance) {
            try {
                vacancyInstance.delete()
                flash.message = "vacancy.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Vacancy ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "vacancy.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Vacancy ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "vacancy.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Vacancy not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def vacancyInstance = Vacancy.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def vacancyInstance = Vacancy.get(params.id)
    }
}
