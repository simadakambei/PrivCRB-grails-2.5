package ru.gbuz.ao.privolgie.app.entity

class CabinetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cabinetInstanceList: Cabinet.list(params), cabinetInstanceTotal: Cabinet.count()]
    }

    def create = {
        def cabinetInstance = new Cabinet()
        cabinetInstance.properties = params
        return [cabinetInstance: cabinetInstance]
    }

    def save = {
        def cabinetInstance = new Cabinet(params)
        if (cabinetInstance.save(flush: true)) {
            flash.message = "cabinet.created"
            flash.args = [cabinetInstance.id]
            flash.defaultMessage = "Cabinet ${cabinetInstance.id} created"
            redirect(action: "show", id: cabinetInstance.id)
        } else {
            render(view: "create", model: [cabinetInstance: cabinetInstance])
        }
    }

    def show = {
        def cabinetInstance = Cabinet.get(params.id)
        if (!cabinetInstance) {
            flash.message = "cabinet.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Cabinet not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [cabinetInstance: cabinetInstance]
        }
    }

    def edit = {
        def cabinetInstance = Cabinet.get(params.id)
        if (!cabinetInstance) {
            flash.message = "cabinet.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Cabinet not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [cabinetInstance: cabinetInstance]
        }
    }

    def update = {
        def cabinetInstance = Cabinet.get(params.id)
        if (cabinetInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (cabinetInstance.version > version) {

                    cabinetInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'cabinet.label', default: 'Cabinet')] as Object[], "Another user has updated this Cabinet while you were editing")
                    render(view: "edit", model: [cabinetInstance: cabinetInstance])
                    return
                }
            }
            cabinetInstance.properties = params
            if (!cabinetInstance.hasErrors() && cabinetInstance.save(flush: true)) {
                flash.message = "cabinet.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Cabinet ${params.id} updated"
                redirect(action: "show", id: cabinetInstance.id)
            } else {
                render(view: "edit", model: [cabinetInstance: cabinetInstance])
            }
        } else {
            flash.message = "cabinet.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Cabinet not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def cabinetInstance = Cabinet.get(params.id)
        if (cabinetInstance) {
            try {
                cabinetInstance.delete(flush: true)
                flash.message = "cabinet.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Cabinet ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "cabinet.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Cabinet ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "cabinet.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Cabinet not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def cabinetInstance = Cabinet.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def cabinetInstance = Cabinet.get(params.id)
    }
}
