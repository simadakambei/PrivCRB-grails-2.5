package ru.gbuz.ao.privolgie.vocs

class PatientInformationTypeController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [patientInformationTypeInstanceList: PatientInformationType.list(params), patientInformationTypeInstanceTotal: PatientInformationType.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [patientInformationTypeInstanceList: PatientInformationType.list(params), patientInformationTypeInstanceTotal: PatientInformationType.count()]
    }

    def create = {
        def patientInformationTypeInstance = new PatientInformationType()
        patientInformationTypeInstance.properties = params
        return [patientInformationTypeInstance: patientInformationTypeInstance]
    }

    def save = {
        def patientInformationTypeInstance = new PatientInformationType(params)
        if (!patientInformationTypeInstance.hasErrors() && patientInformationTypeInstance.save()) {
            flash.message = "patientInformationType.created"
            flash.args = [patientInformationTypeInstance.id]
            flash.defaultMessage = "PatientInformationType ${patientInformationTypeInstance.id} created"
            redirect(action: "show", id: patientInformationTypeInstance.id)
        } else {
            render(view: "create", model: [patientInformationTypeInstance: patientInformationTypeInstance])
        }
    }

    def show = {
        def patientInformationTypeInstance = PatientInformationType.get(params.id)
        if (!patientInformationTypeInstance) {
            flash.message = "patientInformationType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientInformationType not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [patientInformationTypeInstance: patientInformationTypeInstance]
        }
    }

    def public_show = {
        def patientInformationTypeInstance = PatientInformationType.get(params.id)
        if (!patientInformationTypeInstance) {
            flash.message = "patientInformationType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientInformationType not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [patientInformationTypeInstance: patientInformationTypeInstance]
        }
    }

    def edit = {
        def patientInformationTypeInstance = PatientInformationType.get(params.id)
        if (!patientInformationTypeInstance) {
            flash.message = "patientInformationType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientInformationType not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [patientInformationTypeInstance: patientInformationTypeInstance]
        }
    }

    def update = {
        def patientInformationTypeInstance = PatientInformationType.get(params.id)
        if (patientInformationTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (patientInformationTypeInstance.version > version) {

                    patientInformationTypeInstance.errors.rejectValue("version", "patientInformationType.optimistic.locking.failure", "Another user has updated this PatientInformationType while you were editing")
                    render(view: "edit", model: [patientInformationTypeInstance: patientInformationTypeInstance])
                    return
                }
            }
            patientInformationTypeInstance.properties = params
            if (!patientInformationTypeInstance.hasErrors() && patientInformationTypeInstance.save()) {
                flash.message = "patientInformationType.updated"
                flash.args = [params.id]
                flash.defaultMessage = "PatientInformationType ${params.id} updated"
                redirect(action: "show", id: patientInformationTypeInstance.id)
            } else {
                render(view: "edit", model: [patientInformationTypeInstance: patientInformationTypeInstance])
            }
        } else {
            flash.message = "patientInformationType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientInformationType not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def patientInformationTypeInstance = PatientInformationType.get(params.id)
        if (patientInformationTypeInstance) {
            try {
                patientInformationTypeInstance.delete()
                flash.message = "patientInformationType.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "PatientInformationType ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "patientInformationType.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "PatientInformationType ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "patientInformationType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientInformationType not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def patientInformationTypeInstance = PatientInformationType.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def patientInformationTypeInstance = PatientInformationType.get(params.id)
    }
}
