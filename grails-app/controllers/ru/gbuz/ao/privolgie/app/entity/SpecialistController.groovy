package ru.gbuz.ao.privolgie.app.entity

import ru.gbuz.ao.privolgie.security.Person
import ru.gbuz.ao.privolgie.vocs.WorkPlace

class SpecialistController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [specialistInstanceList: Specialist.list(params), specialistInstanceTotal: Specialist.count()]
    }

    def create = {
        def specialistInstance = new Specialist()
        specialistInstance.properties = params
        return [specialistInstance: specialistInstance]
    }

    def save = {
        def specialistInstance = new Specialist(params)
        if (specialistInstance.save(flush: true)) {
            flash.message = "specialist.created"
            flash.args = [specialistInstance.id]
            flash.defaultMessage = "Specialist ${specialistInstance.id} created"
            redirect(action: "show", id: specialistInstance.id)
        } else {
            render(view: "create", model: [specialistInstance: specialistInstance])
        }
    }

    def show = {
        def specialistInstance = Specialist.get(params.id)
        if (!specialistInstance) {
            flash.message = "specialist.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Specialist not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [specialistInstance: specialistInstance]
        }
    }

    def edit = {
        def specialistInstance = Specialist.get(params.id)
        if (!specialistInstance) {
            flash.message = "specialist.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Specialist not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [specialistInstance: specialistInstance]
        }
    }

    def update = {
        def specialistInstance = Specialist.get(params.id)
        if (specialistInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (specialistInstance.version > version) {

                    specialistInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'specialist.label', default: 'Specialist')] as Object[], "Another user has updated this Specialist while you were editing")
                    render(view: "edit", model: [specialistInstance: specialistInstance])
                    return
                }
            }
            specialistInstance.properties = params
            if (!specialistInstance.hasErrors() && specialistInstance.save(flush: true)) {

                flash.message = "specialist.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Specialist ${params.id} updated"
                redirect(action: "show", id: specialistInstance.id)
            } else {
                render(view: "edit", model: [specialistInstance: specialistInstance])
            }
        } else {
            flash.message = "specialist.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Specialist not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def specialistInstance = Specialist.get(params.id)
        if (specialistInstance) {
            try {
                specialistInstance.delete(flush: true)
                flash.message = "specialist.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Specialist ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "specialist.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Specialist ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "specialist.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Specialist not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def remove_person = {
        def specialistInstance = Specialist.get(params.id)
        def personInstance = Person.get(params.person)
        specialistInstance.removeFromPeople(personInstance)
        redirect(action: 'edit', id: params.id)
    }

    def remove_workplace = {
        def specialistInstance = Specialist.get(params.id)
        def workPlaceInstance = WorkPlace.get(params.workplace)
        specialistInstance.removeFromWorkplaces(workPlaceInstance)
        redirect(action: 'edit', id: params.id)
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def specialistInstance = Specialist.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def specialistInstance = Specialist.get(params.id)
    }
}
