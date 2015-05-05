package ru.gbuz.ao.privolgie.vocs

class ManufacturerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [manufacturerInstanceList: Manufacturer.list(params), manufacturerInstanceTotal: Manufacturer.count()]
    }

    def create = {
        def manufacturerInstance = new Manufacturer()
        manufacturerInstance.properties = params
        return [manufacturerInstance: manufacturerInstance]
    }

    def save = {
        def manufacturerInstance = new Manufacturer(params)
        if (manufacturerInstance.save(flush: true)) {
            flash.message = "manufacturer.created"
            flash.args = [manufacturerInstance.id]
            flash.defaultMessage = "Manufacturer ${manufacturerInstance.id} created"
            redirect(action: "show", id: manufacturerInstance.id)
        } else {
            render(view: "create", model: [manufacturerInstance: manufacturerInstance])
        }
    }

    def show = {
        def manufacturerInstance = Manufacturer.get(params.id)
        if (!manufacturerInstance) {
            flash.message = "manufacturer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Manufacturer not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [manufacturerInstance: manufacturerInstance]
        }
    }

    def edit = {
        def manufacturerInstance = Manufacturer.get(params.id)
        if (!manufacturerInstance) {
            flash.message = "manufacturer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Manufacturer not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [manufacturerInstance: manufacturerInstance]
        }
    }

    def update = {
        def manufacturerInstance = Manufacturer.get(params.id)
        if (manufacturerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (manufacturerInstance.version > version) {

                    manufacturerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'manufacturer.label', default: 'Manufacturer')] as Object[], "Another user has updated this Manufacturer while you were editing")
                    render(view: "edit", model: [manufacturerInstance: manufacturerInstance])
                    return
                }
            }
            manufacturerInstance.properties = params
            if (!manufacturerInstance.hasErrors() && manufacturerInstance.save(flush: true)) {
                flash.message = "manufacturer.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Manufacturer ${params.id} updated"
                redirect(action: "show", id: manufacturerInstance.id)
            } else {
                render(view: "edit", model: [manufacturerInstance: manufacturerInstance])
            }
        } else {
            flash.message = "manufacturer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Manufacturer not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def manufacturerInstance = Manufacturer.get(params.id)
        if (manufacturerInstance) {
            try {
                manufacturerInstance.delete(flush: true)
                flash.message = "manufacturer.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Manufacturer ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "manufacturer.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Manufacturer ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "manufacturer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Manufacturer not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def manufacturerInstance = Manufacturer.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def manufacturerInstance = Manufacturer.get(params.id)
    }
}
