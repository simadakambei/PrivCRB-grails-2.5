package ru.gbuz.ao.privolgie.vocs

class WorkPlaceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [workPlaceInstanceList: WorkPlace.list(params), workPlaceInstanceTotal: WorkPlace.count()]
    }

    def create = {
        def workPlaceInstance = new WorkPlace()
        workPlaceInstance.properties = params
        return [workPlaceInstance: workPlaceInstance]
    }

    def save = {
        def workPlaceInstance = new WorkPlace(params)
        if (workPlaceInstance.save(flush: true)) {
            flash.message = "workPlace.created"
            flash.args = [workPlaceInstance.id]
            flash.defaultMessage = "WorkPlace ${workPlaceInstance.id} created"
            redirect(action: "show", id: workPlaceInstance.id)
        } else {
            render(view: "create", model: [workPlaceInstance: workPlaceInstance])
        }
    }

    def show = {
        def workPlaceInstance = WorkPlace.get(params.id)
        if (!workPlaceInstance) {
            flash.message = "workPlace.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "WorkPlace not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [workPlaceInstance: workPlaceInstance]
        }
    }

    def edit = {
        def workPlaceInstance = WorkPlace.get(params.id)
        if (!workPlaceInstance) {
            flash.message = "workPlace.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "WorkPlace not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [workPlaceInstance: workPlaceInstance]
        }
    }

    def update = {
        def workPlaceInstance = WorkPlace.get(params.id)
        if (workPlaceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (workPlaceInstance.version > version) {

                    workPlaceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'workPlace.label', default: 'WorkPlace')] as Object[], "Another user has updated this WorkPlace while you were editing")
                    render(view: "edit", model: [workPlaceInstance: workPlaceInstance])
                    return
                }
            }
            workPlaceInstance.properties = params
            if (!workPlaceInstance.hasErrors() && workPlaceInstance.save(flush: true)) {
                flash.message = "workPlace.updated"
                flash.args = [params.id]
                flash.defaultMessage = "WorkPlace ${params.id} updated"
                redirect(action: "show", id: workPlaceInstance.id)
            } else {
                render(view: "edit", model: [workPlaceInstance: workPlaceInstance])
            }
        } else {
            flash.message = "workPlace.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "WorkPlace not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def workPlaceInstance = WorkPlace.get(params.id)
        if (workPlaceInstance) {
            try {
                workPlaceInstance.delete(flush: true)
                flash.message = "workPlace.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "WorkPlace ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "workPlace.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "WorkPlace ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "workPlace.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "WorkPlace not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def workPlaceInstance = WorkPlace.get(params.id)
        [workPlaceInstance: workPlaceInstance]
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def workPlaceInstance = WorkPlace.get(params.id)
        [workPlaceInstance: workPlaceInstance]
    }
}
