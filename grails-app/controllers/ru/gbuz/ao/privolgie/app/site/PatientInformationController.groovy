package ru.gbuz.ao.privolgie.app.site

import ru.gbuz.ao.privolgie.vocs.PatientInformationType

class PatientInformationController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [patientInformationInstanceList: PatientInformation.list(params), patientInformationInstanceTotal: PatientInformation.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def patientInformationTypeList = PatientInformationType.list()

        [patientInformationInstanceList: PatientInformation.list(params), patientInformationInstanceTotal: PatientInformation.count(), patientInformationTypeList: PatientInformationType.list()]
    }

    def create = {
        def patientInformationInstance = new PatientInformation()
        patientInformationInstance.properties = params
        return [patientInformationInstance: patientInformationInstance]
    }

    def save = {
        def patientInformationInstance = new PatientInformation(params)
        if (!patientInformationInstance.hasErrors() && patientInformationInstance.save()) {
            flash.message = "patientInformation.created"
            flash.args = [patientInformationInstance.id]
            flash.defaultMessage = "PatientInformation ${patientInformationInstance.id} created"
            redirect(action: "show", id: patientInformationInstance.id)
        } else {
            render(view: "create", model: [patientInformationInstance: patientInformationInstance])
        }
    }

    def show = {
        def patientInformationInstance = PatientInformation.get(params.id)
        if (!patientInformationInstance) {
            flash.message = "patientInformation.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientInformation not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [patientInformationInstance: patientInformationInstance]
        }
    }

    def public_show = {
        def patientInformationInstance = PatientInformation.get(params.id)
        if (!patientInformationInstance) {
            flash.message = "patientInformation.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientInformation not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [patientInformationInstance: patientInformationInstance]
        }
    }

    def edit = {
        def patientInformationInstance = PatientInformation.get(params.id)
        if (!patientInformationInstance) {
            flash.message = "patientInformation.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientInformation not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [patientInformationInstance: patientInformationInstance]
        }
    }

    def update = {
        def patientInformationInstance = PatientInformation.get(params.id)
        if (patientInformationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (patientInformationInstance.version > version) {

                    patientInformationInstance.errors.rejectValue("version", "patientInformation.optimistic.locking.failure", "Another user has updated this PatientInformation while you were editing")
                    render(view: "edit", model: [patientInformationInstance: patientInformationInstance])
                    return
                }
            }
            patientInformationInstance.properties = params
            if (!patientInformationInstance.hasErrors() && patientInformationInstance.save()) {
                flash.message = "patientInformation.updated"
                flash.args = [params.id]
                flash.defaultMessage = "PatientInformation ${params.id} updated"
                redirect(action: "show", id: patientInformationInstance.id)
            } else {
                render(view: "edit", model: [patientInformationInstance: patientInformationInstance])
            }
        } else {
            flash.message = "patientInformation.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientInformation not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def patientInformationInstance = PatientInformation.get(params.id)
        if (patientInformationInstance) {
            try {
                patientInformationInstance.delete()
                flash.message = "patientInformation.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "PatientInformation ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "patientInformation.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "PatientInformation ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "patientInformation.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PatientInformation not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def patientInformationInstance = PatientInformation.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def patientInformationInstance = PatientInformation.get(params.id)
    }

    def upload() {
        def f = request.getFile('файл для выгрузки')
        if (f.empty) {
            flash.message = 'file cannot be empty'
            render(view: 'uploadForm')
            return
        }

        f.transferTo(new File('/files/docs/'))
    }
}
