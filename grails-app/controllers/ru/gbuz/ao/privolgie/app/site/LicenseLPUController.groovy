package ru.gbuz.ao.privolgie.app.site

class LicenseLPUController {


    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [licenseLPUInstanceList: LicenseLPU.list(params), licenseLPUInstanceTotal: LicenseLPU.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [licenseLPUInstanceList: LicenseLPU.list(params), licenseLPUInstanceTotal: LicenseLPU.count()]
    }

    def create = {
        def licenseLPUInstance = new LicenseLPU()
        licenseLPUInstance.properties = params
        return [licenseLPUInstance: licenseLPUInstance]
    }

    def save = {
        def licenseLPUInstance = new LicenseLPU(params)
        if (licenseLPUInstance.save(flush: true)) {
            flash.message = "licenseLPU.created"
            flash.args = [licenseLPUInstance.id]
            flash.defaultMessage = "LicenseLPU ${licenseLPUInstance.id} created"
            redirect(action: "show", id: licenseLPUInstance.id)
        } else {
            render(view: "create", model: [licenseLPUInstance: licenseLPUInstance])
        }
    }

    def show = {
        def licenseLPUInstance = LicenseLPU.get(params.id)
        if (!licenseLPUInstance) {
            flash.message = "licenseLPU.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LicenseLPU not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [licenseLPUInstance: licenseLPUInstance]
        }
    }

    def public_show = {
        def licenseLPUInstance = LicenseLPU.get(params.id)
        if (!licenseLPUInstance) {
            flash.message = "licenseLPU.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LicenseLPU not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [licenseLPUInstance: licenseLPUInstance]
        }
    }

    def edit = {
        def licenseLPUInstance = LicenseLPU.get(params.id)
        if (!licenseLPUInstance) {
            flash.message = "licenseLPU.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LicenseLPU not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [licenseLPUInstance: licenseLPUInstance]
        }
    }

    def update = {
        def licenseLPUInstance = LicenseLPU.get(params.id)
        if (licenseLPUInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (licenseLPUInstance.version > version) {

                    licenseLPUInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'licenseLPU.label', default: 'LicenseLPU')] as Object[], "Another user has updated this LicenseLPU while you were editing")
                    render(view: "edit", model: [licenseLPUInstance: licenseLPUInstance])
                    return
                }
            }
            licenseLPUInstance.properties = params
            if (!licenseLPUInstance.hasErrors() && licenseLPUInstance.save(flush: true)) {
                flash.message = "licenseLPU.updated"
                flash.args = [params.id]
                flash.defaultMessage = "LicenseLPU ${params.id} updated"
                redirect(action: "show", id: licenseLPUInstance.id)
            } else {
                render(view: "edit", model: [licenseLPUInstance: licenseLPUInstance])
            }
        } else {
            flash.message = "licenseLPU.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LicenseLPU not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def licenseLPUInstance = LicenseLPU.get(params.id)
        if (licenseLPUInstance) {
            try {
                licenseLPUInstance.delete(flush: true)
                flash.message = "licenseLPU.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "LicenseLPU ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "licenseLPU.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "LicenseLPU ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "licenseLPU.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LicenseLPU not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def licenseLPUInstance = LicenseLPU.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def licenseLPUInstance = LicenseLPU.get(params.id)
    }
}
