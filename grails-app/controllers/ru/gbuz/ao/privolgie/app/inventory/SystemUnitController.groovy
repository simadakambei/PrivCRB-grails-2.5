package ru.gbuz.ao.privolgie.app.inventory

class SystemUnitController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [systemUnitInstanceList: SystemUnit.list(params), systemUnitInstanceTotal: SystemUnit.count()]
    }

    def create = {
        def systemUnitInstance = new SystemUnit()
        systemUnitInstance.properties = params
        return [systemUnitInstance: systemUnitInstance]
    }

    def save = {
        def systemUnitInstance = new SystemUnit(params)
        if (systemUnitInstance.save(flush: true)) {
            flash.message = "systemUnit.created"
            flash.args = [systemUnitInstance.id]
            flash.defaultMessage = "SystemUnit ${systemUnitInstance.id} created"
            redirect(action: "show", id: systemUnitInstance.id)
        } else {
            render(view: "create", model: [systemUnitInstance: systemUnitInstance])
        }
    }

    def show = {
        def systemUnitInstance = SystemUnit.get(params.id)
        if (!systemUnitInstance) {
            flash.message = "systemUnit.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "SystemUnit not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [systemUnitInstance: systemUnitInstance]
        }
    }

    def public_show = {
        def systemUnitInstance = SystemUnit.get(params.id)
        if (!systemUnitInstance) {
            flash.message = "systemUnit.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "SystemUnit not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [systemUnitInstance: systemUnitInstance]
        }
    }

    def edit = {
        def systemUnitInstance = SystemUnit.get(params.id)
        if (!systemUnitInstance) {
            flash.message = "systemUnit.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "SystemUnit not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [systemUnitInstance: systemUnitInstance]
        }
    }

    def update = {
        def systemUnitInstance = SystemUnit.get(params.id)
        if (systemUnitInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (systemUnitInstance.version > version) {

                    systemUnitInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'systemUnit.label', default: 'SystemUnit')] as Object[], "Another user has updated this SystemUnit while you were editing")
                    render(view: "edit", model: [systemUnitInstance: systemUnitInstance])
                    return
                }
            }
            systemUnitInstance.properties = params
            if (!systemUnitInstance.hasErrors() && systemUnitInstance.save(flush: true)) {
                flash.message = "systemUnit.updated"
                flash.args = [params.id]
                flash.defaultMessage = "SystemUnit ${params.id} updated"
                redirect(action: "show", id: systemUnitInstance.id)
            } else {
                render(view: "edit", model: [systemUnitInstance: systemUnitInstance])
            }
        } else {
            flash.message = "systemUnit.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "SystemUnit not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def systemUnitInstance = SystemUnit.get(params.id)
        if (systemUnitInstance) {
            try {
                systemUnitInstance.delete(flush: true)
                flash.message = "systemUnit.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "SystemUnit ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "systemUnit.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "SystemUnit ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "systemUnit.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "SystemUnit not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def systemUnitInstance = SystemUnit.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def systemUnitInstance = SystemUnit.get(params.id)
    }
}
