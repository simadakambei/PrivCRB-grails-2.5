package ru.gbuz.ao.privolgie.app.site

class PatientResponseController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [patientResponseInstanceList: PatientResponse.list(params), patientResponseInstanceTotal: PatientResponse.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [patientResponseInstanceList: PatientResponse.list(params), patientResponseInstanceTotal: PatientResponse.count()]
    }

    def create = {
        def patientResponseInstance = new PatientResponse()
        patientResponseInstance.properties = params
        return [patientResponseInstance: patientResponseInstance]
    }

    def save = {
        def patientResponseInstance = new PatientResponse(params)
        if (!patientResponseInstance.hasErrors() && patientResponseInstance.save()) {
            flash.message = "patientResponse.created"
            flash.args = [patientResponseInstance.id]
            flash.defaultMessage = "PatientResponse ${patientResponseInstance.id} created"
            redirect(action: "public_show", id: patientResponseInstance.id)
        } else {
            render(view: "create", model: [patientResponseInstance: patientResponseInstance])
        }
    }

    def show = {
        def patientResponseInstance = PatientResponse.get(params.id)
        if (!patientResponseInstance) {
            flash.message = "patientResponse.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientResponse not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [patientResponseInstance: patientResponseInstance]
        }
    }

    def public_show = {
        def patientResponseInstance = PatientResponse.get(params.id)
        if (!patientResponseInstance) {
            flash.message = "patientResponse.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientResponse not found with id ${params.id}"
            redirect(action: "public_list")
        } else {
            return [patientResponseInstance: patientResponseInstance]
        }
    }

    def edit = {
        def patientResponseInstance = PatientResponse.get(params.id)
        if (!patientResponseInstance) {
            flash.message = "patientResponse.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientResponse not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [patientResponseInstance: patientResponseInstance]
        }
    }

    def update = {
        def patientResponseInstance = PatientResponse.get(params.id)
        if (patientResponseInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (patientResponseInstance.version > version) {

                    patientResponseInstance.errors.rejectValue("version", "patientResponse.optimistic.locking.failure", "Another user has updated this PatientResponse while you were editing")
                    render(view: "edit", model: [patientResponseInstance: patientResponseInstance])
                    return
                }
            }
            patientResponseInstance.properties = params
            if (!patientResponseInstance.hasErrors() && patientResponseInstance.save()) {
                flash.message = "patientResponse.updated"
                flash.args = [params.id]
                flash.defaultMessage = "PatientResponse ${params.id} updated"
                redirect(action: "show", id: patientResponseInstance.id)
            } else {
                render(view: "edit", model: [patientResponseInstance: patientResponseInstance])
            }
        } else {
            flash.message = "patientResponse.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientResponse not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def patientResponseInstance = PatientResponse.get(params.id)
        if (patientResponseInstance) {
            try {
                patientResponseInstance.delete()
                flash.message = "patientResponse.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "PatientResponse ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "patientResponse.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "PatientResponse ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "patientResponse.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientResponse not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def patientResponseInstance = PatientResponse.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def patientResponseInstance = PatientResponse.get(params.id)
    }
}
