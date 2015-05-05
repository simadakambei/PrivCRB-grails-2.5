package ru.gbuz.ao.privolgie.vocs

import ru.gbuz.ao.privolgie.app.entity.Specialist

class SectionMedicalCareController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [sectionMedicalCareInstanceList: SectionMedicalCare.list(params), sectionMedicalCareInstanceTotal: SectionMedicalCare.count()]
    }

    def create = {
        def sectionMedicalCareInstance = new SectionMedicalCare()
        sectionMedicalCareInstance.properties = params
        return [sectionMedicalCareInstance: sectionMedicalCareInstance]
    }


    def save = {
        def sectionMedicalCareInstance = new SectionMedicalCare(params)
        if (!sectionMedicalCareInstance.hasErrors() && sectionMedicalCareInstance.save()) {
            flash.message = "sectionMedicalCare.created"
            flash.args = [sectionMedicalCareInstance.id]
            flash.defaultMessage = "SectionMedicalCare ${sectionMedicalCareInstance.id} created"
            redirect(action: "show", id: sectionMedicalCareInstance.id)
        } else {
            render(view: "create", model: [sectionMedicalCareInstance: sectionMedicalCareInstance])
        }
    }

    def show = {
        def sectionMedicalCareInstance = SectionMedicalCare.get(params.id)
        if (!sectionMedicalCareInstance) {
            flash.message = "sectionMedicalCare.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "SectionMedicalCare not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [sectionMedicalCareInstance: sectionMedicalCareInstance]
        }
    }

    def edit = {
        def sectionMedicalCareInstance = SectionMedicalCare.get(params.id)
        if (!sectionMedicalCareInstance) {
            flash.message = "sectionMedicalCare.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "SectionMedicalCare not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [sectionMedicalCareInstance: sectionMedicalCareInstance]
        }
    }

    def update = {
        def sectionMedicalCareInstance = SectionMedicalCare.get(params.id)
        if (sectionMedicalCareInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sectionMedicalCareInstance.version > version) {

                    sectionMedicalCareInstance.errors.rejectValue("version", "sectionMedicalCare.optimistic.locking.failure", "Another user has updated this SectionMedicalCare while you were editing")
                    render(view: "edit", model: [sectionMedicalCareInstance: sectionMedicalCareInstance])
                    return
                }
            }
            sectionMedicalCareInstance.properties = params
            if (!sectionMedicalCareInstance.hasErrors() && sectionMedicalCareInstance.save()) {
                flash.message = "sectionMedicalCare.updated"
                flash.args = [params.id]
                flash.defaultMessage = "SectionMedicalCare ${params.id} updated"
                redirect(action: "show", id: sectionMedicalCareInstance.id)
            } else {
                render(view: "edit", model: [sectionMedicalCareInstance: sectionMedicalCareInstance])
            }
        } else {
            flash.message = "sectionMedicalCare.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "SectionMedicalCare not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def sectionMedicalCareInstance = SectionMedicalCare.get(params.id)
        if (sectionMedicalCareInstance) {
            try {
                sectionMedicalCareInstance.delete()
                flash.message = "sectionMedicalCare.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "SectionMedicalCare ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "sectionMedicalCare.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "SectionMedicalCare ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "sectionMedicalCare.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "SectionMedicalCare not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
