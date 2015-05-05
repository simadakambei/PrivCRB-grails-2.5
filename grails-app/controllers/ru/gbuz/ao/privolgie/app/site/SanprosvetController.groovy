package ru.gbuz.ao.privolgie.app.site

class SanprosvetController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [sanprosvetInstanceList: Sanprosvet.list(params), sanprosvetInstanceTotal: Sanprosvet.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [sanprosvetInstanceList: Sanprosvet.list(params).reverse(true), sanprosvetInstanceTotal: Sanprosvet.count()]
    }

    def create = {
        def sanprosvetInstance = new Sanprosvet()
        sanprosvetInstance.properties = params
        return [sanprosvetInstance: sanprosvetInstance]
    }

    def save = {
        def sanprosvetInstance = new Sanprosvet(params)
        if (!sanprosvetInstance.hasErrors() && sanprosvetInstance.save()) {
            flash.message = "sanprosvet.created"
            flash.args = [sanprosvetInstance.id]
            flash.defaultMessage = "Sanprosvet ${sanprosvetInstance.id} created"
            redirect(action: "show", id: sanprosvetInstance.id)
        } else {
            render(view: "create", model: [sanprosvetInstance: sanprosvetInstance])
        }
    }

    def show = {
        def sanprosvetInstance = Sanprosvet.get(params.id)
        if (!sanprosvetInstance) {
            flash.message = "sanprosvet.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Sanprosvet not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [sanprosvetInstance: sanprosvetInstance]
        }
    }

    def public_show = {
        def sanprosvetInstance = Sanprosvet.get(params.id)
        if (!sanprosvetInstance) {
            flash.message = "sanprosvet.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Sanprosvet not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [sanprosvetInstance: sanprosvetInstance]
        }
    }

    def edit = {
        def sanprosvetInstance = Sanprosvet.get(params.id)
        if (!sanprosvetInstance) {
            flash.message = "sanprosvet.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Sanprosvet not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [sanprosvetInstance: sanprosvetInstance]
        }
    }

    def update = {
        def sanprosvetInstance = Sanprosvet.get(params.id)
        if (sanprosvetInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sanprosvetInstance.version > version) {

                    sanprosvetInstance.errors.rejectValue("version", "sanprosvet.optimistic.locking.failure", "Another user has updated this Sanprosvet while you were editing")
                    render(view: "edit", model: [sanprosvetInstance: sanprosvetInstance])
                    return
                }
            }
            sanprosvetInstance.properties = params
            if (!sanprosvetInstance.hasErrors() && sanprosvetInstance.save()) {
                flash.message = "sanprosvet.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Sanprosvet ${params.id} updated"
                redirect(action: "show", id: sanprosvetInstance.id)
            } else {
                render(view: "edit", model: [sanprosvetInstance: sanprosvetInstance])
            }
        } else {
            flash.message = "sanprosvet.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Sanprosvet not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def sanprosvetInstance = Sanprosvet.get(params.id)
        if (sanprosvetInstance) {
            try {
                sanprosvetInstance.delete()
                flash.message = "sanprosvet.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Sanprosvet ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "sanprosvet.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Sanprosvet ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "sanprosvet.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Sanprosvet not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
