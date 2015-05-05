package ru.gbuz.ao.privolgie.app.inventory

class ARMController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ARMInstanceList: ARM.list(params), ARMInstanceTotal: ARM.count()]
    }

    def create = {
        def ARMInstance = new ARM()
        ARMInstance.properties = params
        return [ARMInstance: ARMInstance]
    }

    def save = {
        def ARMInstance = new ARM(params)
        if (ARMInstance.save(flush: true)) {
            flash.message = "ARM.created"
            flash.args = [ARMInstance.id]
            flash.defaultMessage = "ARM ${ARMInstance.id} created"
            redirect(action: "show", id: ARMInstance.id)
        } else {
            render(view: "create", model: [ARMInstance: ARMInstance])
        }
    }

    def show = {
        def ARMInstance = ARM.get(params.id)
        if (!ARMInstance) {
            flash.message = "ARM.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ARM not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [ARMInstance: ARMInstance]
        }
    }

    def public_show = {
        def ARMInstance = ARM.get(params.id)
        if (!ARMInstance) {
            flash.message = "ARM.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ARM not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [ARMInstance: ARMInstance]
        }
    }

    def edit = {
        def ARMInstance = ARM.get(params.id)
        if (!ARMInstance) {
            flash.message = "ARM.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ARM not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [ARMInstance: ARMInstance]
        }
    }

    def update = {
        def ARMInstance = ARM.get(params.id)
        if (ARMInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ARMInstance.version > version) {

                    ARMInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ARM.label', default: 'ARM')] as Object[], "Another user has updated this ARM while you were editing")
                    render(view: "edit", model: [ARMInstance: ARMInstance])
                    return
                }
            }
            ARMInstance.properties = params
            if (!ARMInstance.hasErrors() && ARMInstance.save(flush: true)) {
                flash.message = "ARM.updated"
                flash.args = [params.id]
                flash.defaultMessage = "ARM ${params.id} updated"
                redirect(action: "show", id: ARMInstance.id)
            } else {
                render(view: "edit", model: [ARMInstance: ARMInstance])
            }
        } else {
            flash.message = "ARM.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ARM not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ARMInstance = ARM.get(params.id)
        if (ARMInstance) {
            try {
                ARMInstance.delete(flush: true)
                flash.message = "ARM.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ARM ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "ARM.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ARM ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "ARM.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ARM not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def ARMInstance = ARM.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def ARMInstance = ARM.get(params.id)
    }
}
