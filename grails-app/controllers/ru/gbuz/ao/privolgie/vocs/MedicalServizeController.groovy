package ru.gbuz.ao.privolgie.vocs

import antlr.collections.List
import ru.gbuz.ao.privolgie.app.entity.Specialist

class MedicalServizeController {

    def index = { redirect(action: "public_list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [medicalServizeInstanceList: MedicalServize.list(params), medicalServizeInstanceTotal: MedicalServize.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def sectionMedicalCareList = SectionMedicalCare.list(sort: "name", order: "asc")
        def smc = SectionMedicalCare.count()
        def specialists = sectionMedicalCareList.specialists
        println smc
        println sectionMedicalCareList
        println specialists.toList()
        [medicalServizeInstanceList: MedicalServize.list(params), medicalServizeInstanceTotal: MedicalServize.count(), sectionMedicalCareList: SectionMedicalCare.list(sort: "name", order: "asc")]
    }

    def create = {
        def medicalServizeInstance = new MedicalServize()
        medicalServizeInstance.properties = params
        return [medicalServizeInstance: medicalServizeInstance]
    }

    def save = {
        def medicalServizeInstance = new MedicalServize(params)
        if (!medicalServizeInstance.hasErrors() && medicalServizeInstance.save()) {
            flash.message = "medicalServize.created"
            flash.args = [medicalServizeInstance.id]
            flash.defaultMessage = "MedicalServize ${medicalServizeInstance.id} created"
            redirect(action: "show", id: medicalServizeInstance.id)
        } else {
            render(view: "create", model: [medicalServizeInstance: medicalServizeInstance])
        }
    }

    def show = {
        def medicalServizeInstance = MedicalServize.get(params.id)
        if (!medicalServizeInstance) {
            flash.message = "medicalServize.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "MedicalServize not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [medicalServizeInstance: medicalServizeInstance]
        }
    }

    def edit = {
        def medicalServizeInstance = MedicalServize.get(params.id)
        if (!medicalServizeInstance) {
            flash.message = "medicalServize.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "MedicalServize not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [medicalServizeInstance: medicalServizeInstance]
        }
    }

    def update = {
        def medicalServizeInstance = MedicalServize.get(params.id)
        if (medicalServizeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (medicalServizeInstance.version > version) {

                    medicalServizeInstance.errors.rejectValue("version", "medicalServize.optimistic.locking.failure", "Another user has updated this MedicalServize while you were editing")
                    render(view: "edit", model: [medicalServizeInstance: medicalServizeInstance])
                    return
                }
            }
            medicalServizeInstance.properties = params
            if (!medicalServizeInstance.hasErrors() && medicalServizeInstance.save()) {
                flash.message = "medicalServize.updated"
                flash.args = [params.id]
                flash.defaultMessage = "MedicalServize ${params.id} updated"
                redirect(action: "show", id: medicalServizeInstance.id)
            } else {
                render(view: "edit", model: [medicalServizeInstance: medicalServizeInstance])
            }
        } else {
            flash.message = "medicalServize.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "MedicalServize not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def medicalServizeInstance = MedicalServize.get(params.id)
        if (medicalServizeInstance) {
            try {
                medicalServizeInstance.delete()
                flash.message = "medicalServize.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "MedicalServize ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "medicalServize.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "MedicalServize ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "medicalServize.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "MedicalServize not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
