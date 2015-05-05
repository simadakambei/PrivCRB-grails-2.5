package ru.gbuz.ao.privolgie.vocs

class ExternalAccessoryTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [externalAccessoryTypeInstanceList: ExternalAccessoryType.list(params), externalAccessoryTypeInstanceTotal: ExternalAccessoryType.count()]
    }

    def create = {
        def externalAccessoryTypeInstance = new ExternalAccessoryType()
        externalAccessoryTypeInstance.properties = params
        return [externalAccessoryTypeInstance: externalAccessoryTypeInstance]
    }

    def save = {
        def externalAccessoryTypeInstance = new ExternalAccessoryType(params)
        if (externalAccessoryTypeInstance.save(flush: true)) {
            flash.message = "externalAccessoryType.created"
            flash.args = [externalAccessoryTypeInstance.id]
            flash.defaultMessage = "ExternalAccessoryType ${externalAccessoryTypeInstance.id} created"
            redirect(action: "show", id: externalAccessoryTypeInstance.id)
        } else {
            render(view: "create", model: [externalAccessoryTypeInstance: externalAccessoryTypeInstance])
        }
    }

    def show = {
        def externalAccessoryTypeInstance = ExternalAccessoryType.get(params.id)
        if (!externalAccessoryTypeInstance) {
            flash.message = "externalAccessoryType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ExternalAccessoryType not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [externalAccessoryTypeInstance: externalAccessoryTypeInstance]
        }
    }

    def edit = {
        def externalAccessoryTypeInstance = ExternalAccessoryType.get(params.id)
        if (!externalAccessoryTypeInstance) {
            flash.message = "externalAccessoryType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ExternalAccessoryType not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [externalAccessoryTypeInstance: externalAccessoryTypeInstance]
        }
    }

    def update = {
        def externalAccessoryTypeInstance = ExternalAccessoryType.get(params.id)
        if (externalAccessoryTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (externalAccessoryTypeInstance.version > version) {

                    externalAccessoryTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'externalAccessoryType.label', default: 'ExternalAccessoryType')] as Object[], "Another user has updated this ExternalAccessoryType while you were editing")
                    render(view: "edit", model: [externalAccessoryTypeInstance: externalAccessoryTypeInstance])
                    return
                }
            }
            externalAccessoryTypeInstance.properties = params
            if (!externalAccessoryTypeInstance.hasErrors() && externalAccessoryTypeInstance.save(flush: true)) {
                flash.message = "externalAccessoryType.updated"
                flash.args = [params.id]
                flash.defaultMessage = "ExternalAccessoryType ${params.id} updated"
                redirect(action: "show", id: externalAccessoryTypeInstance.id)
            } else {
                render(view: "edit", model: [externalAccessoryTypeInstance: externalAccessoryTypeInstance])
            }
        } else {
            flash.message = "externalAccessoryType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ExternalAccessoryType not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def externalAccessoryTypeInstance = ExternalAccessoryType.get(params.id)
        if (externalAccessoryTypeInstance) {
            try {
                externalAccessoryTypeInstance.delete(flush: true)
                flash.message = "externalAccessoryType.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ExternalAccessoryType ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "externalAccessoryType.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ExternalAccessoryType ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "externalAccessoryType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ExternalAccessoryType not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def externalAccessoryTypeInstance = ExternalAccessoryType.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def externalAccessoryTypeInstance = ExternalAccessoryType.get(params.id)
    }
}
