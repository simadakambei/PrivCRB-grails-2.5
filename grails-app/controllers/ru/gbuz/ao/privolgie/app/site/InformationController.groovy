package ru.gbuz.ao.privolgie.app.site

class InformationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [informationInstanceList: Information.list(params), informationInstanceTotal: Information.count()]
    }
    def public_list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [informationInstanceList: Information.list(params), informationInstanceTotal: Information.count()]
    }

    def create = {
        def informationInstance = new Information()
        informationInstance.properties = params
        return [informationInstance: informationInstance]
    }

    def save = {
        def informationInstance = new Information(params)
        if (informationInstance.save(flush: true)) {
            flash.message = "information.created"
            flash.args = [informationInstance.id]
            flash.defaultMessage = "Information ${informationInstance.id} created"
            redirect(action: "show", id: informationInstance.id)
        } else {
            render(view: "create", model: [informationInstance: informationInstance])
        }
    }

    def show = {
        def informationInstance = Information.get(params.id)
        if (!informationInstance) {
            flash.message = "information.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Information not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [informationInstance: informationInstance]
        }
    }

    def public_show = {
        def informationInstance = Information.get(params.id)
        if (!informationInstance) {
            flash.message = "information.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Information not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [informationInstance: informationInstance]
        }
    }

    def edit = {
        def informationInstance = Information.get(params.id)
        if (!informationInstance) {
            flash.message = "information.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Information not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [informationInstance: informationInstance]
        }
    }

    def update = {
        def informationInstance = Information.get(params.id)
        if (informationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (informationInstance.version > version) {

                    informationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'information.label', default: 'Information')] as Object[], "Another user has updated this Information while you were editing")
                    render(view: "edit", model: [informationInstance: informationInstance])
                    return
                }
            }
            informationInstance.properties = params
            if (!informationInstance.hasErrors() && informationInstance.save(flush: true)) {
                flash.message = "information.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Information ${params.id} updated"
                redirect(action: "show", id: informationInstance.id)
            } else {
                render(view: "edit", model: [informationInstance: informationInstance])
            }
        } else {
            flash.message = "information.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Information not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def informationInstance = Information.get(params.id)
        if (informationInstance) {
            try {
                informationInstance.delete(flush: true)
                flash.message = "information.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Information ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "information.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Information ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "information.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Information not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def informationInstance = Information.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def informationInstance = Information.get(params.id)
    }
}
