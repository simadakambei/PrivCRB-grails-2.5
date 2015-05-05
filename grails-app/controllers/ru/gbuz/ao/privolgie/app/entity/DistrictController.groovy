package ru.gbuz.ao.privolgie.app.entity

class DistrictController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [districtInstanceList: District.list(params), districtInstanceTotal: District.count()]
    }

    def create = {
        def districtInstance = new District()
        districtInstance.properties = params
        return [districtInstance: districtInstance]
    }

    def save = {
        def districtInstance = new District(params)
        if (districtInstance.save(flush: true)) {
            flash.message = "district.created"
            flash.args = [districtInstance.id]
            flash.defaultMessage = "District ${districtInstance.id} created"
            redirect(action: "show", id: districtInstance.id)
        } else {
            render(view: "create", model: [districtInstance: districtInstance])
        }
    }

    def show = {
        def districtInstance = District.get(params.id)
        if (!districtInstance) {
            flash.message = "district.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "District not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [districtInstance: districtInstance]
        }
    }

    def edit = {
        def districtInstance = District.get(params.id)
        if (!districtInstance) {
            flash.message = "district.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "District not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [districtInstance: districtInstance]
        }
    }

    def update = {
        def districtInstance = District.get(params.id)
        if (districtInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (districtInstance.version > version) {

                    districtInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'district.label', default: 'District')] as Object[], "Another user has updated this District while you were editing")
                    render(view: "edit", model: [districtInstance: districtInstance])
                    return
                }
            }
            districtInstance.properties = params
            if (!districtInstance.hasErrors() && districtInstance.save(flush: true)) {
                flash.message = "district.updated"
                flash.args = [params.id]
                flash.defaultMessage = "District ${params.id} updated"
                redirect(action: "show", id: districtInstance.id)
            } else {
                render(view: "edit", model: [districtInstance: districtInstance])
            }
        } else {
            flash.message = "district.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "District not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def districtInstance = District.get(params.id)
        if (districtInstance) {
            try {
                districtInstance.delete(flush: true)
                flash.message = "district.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "District ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "district.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "District ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "district.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "District not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def districtInstance = District.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def districtInstance = District.get(params.id)
    }
}
