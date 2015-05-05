package ru.gbuz.ao.privolgie.app.inventory

import ru.gbuz.ao.privolgie.vocs.ExternalAccessoryType

class ExternalAccessoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def getType(device) {
        def criteria = ExternalAccessory.createCriteria()
        def result = criteria.list {
            eq("externalAccessoryType", device)
        }
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def externalAccessories
        if (params.device) {
            def externalAccessoryTypeInstance = ExternalAccessoryType.findByEng_title(params.device)
            externalAccessories = getType(externalAccessoryTypeInstance)
        } else {
            externalAccessories = ExternalAccessory.list(params)
        }
        [externalAccessoryInstanceList: externalAccessories, externalAccessoryInstanceTotal: ExternalAccessory.count()]
    }

    def create = {
        def externalAccessoryInstance = new ExternalAccessory()
        externalAccessoryInstance.properties = params
        return [externalAccessoryInstance: externalAccessoryInstance]
    }

    def save = {
        def externalAccessoryInstance = new ExternalAccessory(params)
        if (externalAccessoryInstance.save(flush: true)) {
            flash.message = "externalAccessory.created"
            flash.args = [externalAccessoryInstance.id]
            flash.defaultMessage = "ExternalAccessory ${externalAccessoryInstance.id} created"
            redirect(action: "show", id: externalAccessoryInstance.id)
        } else {
            render(view: "create", model: [externalAccessoryInstance: externalAccessoryInstance])
        }
    }

    def show = {
        def externalAccessoryInstance = ExternalAccessory.get(params.id)
        if (!externalAccessoryInstance) {
            flash.message = "externalAccessory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ExternalAccessory not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [externalAccessoryInstance: externalAccessoryInstance]
        }
    }

    def edit = {
        def externalAccessoryInstance = ExternalAccessory.get(params.id)
        if (!externalAccessoryInstance) {
            flash.message = "externalAccessory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ExternalAccessory not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [externalAccessoryInstance: externalAccessoryInstance]
        }
    }

    def update = {
        def externalAccessoryInstance = ExternalAccessory.get(params.id)
        if (externalAccessoryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (externalAccessoryInstance.version > version) {

                    externalAccessoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'externalAccessory.label', default: 'ExternalAccessory')] as Object[], "Another user has updated this ExternalAccessory while you were editing")
                    render(view: "edit", model: [externalAccessoryInstance: externalAccessoryInstance])
                    return
                }
            }
            externalAccessoryInstance.properties = params
            if (!externalAccessoryInstance.hasErrors() && externalAccessoryInstance.save(flush: true)) {
                flash.message = "externalAccessory.updated"
                flash.args = [params.id]
                flash.defaultMessage = "ExternalAccessory ${params.id} updated"
                redirect(action: "show", id: externalAccessoryInstance.id)
            } else {
                render(view: "edit", model: [externalAccessoryInstance: externalAccessoryInstance])
            }
        } else {
            flash.message = "externalAccessory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ExternalAccessory not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def externalAccessoryInstance = ExternalAccessory.get(params.id)
        if (externalAccessoryInstance) {
            try {
                externalAccessoryInstance.delete(flush: true)
                flash.message = "externalAccessory.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ExternalAccessory ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "externalAccessory.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ExternalAccessory ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "externalAccessory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ExternalAccessory not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def externalAccessoryInstance = ExternalAccessory.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def externalAccessoryInstance = ExternalAccessory.get(params.id)
    }
}
