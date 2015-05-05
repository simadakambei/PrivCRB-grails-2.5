package ru.gbuz.ao.privolgie.vocs

class ServicePopulationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 25, 1000)
        [servicePopulationInstanceList: ServicePopulation.list(params), servicePopulationInstanceTotal: ServicePopulation.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.int('max') : 25, 500)
        [servicePopulationInstanceList: ServicePopulation.list(params), servicePopulationInstanceTotal: ServicePopulation.count()]
    }

    def create = {
        def servicePopulationInstance = new ServicePopulation()
        servicePopulationInstance.properties = params
        return [servicePopulationInstance: servicePopulationInstance]
    }

    def save = {
        def servicePopulationInstance = new ServicePopulation(params)
        if (servicePopulationInstance.save(flush: true)) {
            flash.message = "servicePopulation.created"
            flash.args = [servicePopulationInstance.id]
            flash.defaultMessage = "ServicePopulation ${servicePopulationInstance.id} created"
            redirect(action: "show", id: servicePopulationInstance.id)
        } else {
            render(view: "create", model: [servicePopulationInstance: servicePopulationInstance])
        }
    }

    def show = {
        def servicePopulationInstance = ServicePopulation.get(params.id)
        if (!servicePopulationInstance) {
            flash.message = "servicePopulation.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ServicePopulation not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [servicePopulationInstance: servicePopulationInstance]
        }
    }

    def edit = {
        def servicePopulationInstance = ServicePopulation.get(params.id)
        if (!servicePopulationInstance) {
            flash.message = "servicePopulation.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ServicePopulation not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [servicePopulationInstance: servicePopulationInstance]
        }
    }

    def update = {
        def servicePopulationInstance = ServicePopulation.get(params.id)
        if (servicePopulationInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (servicePopulationInstance.version > version) {

                    servicePopulationInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'servicePopulation.label', default: 'ServicePopulation')] as Object[], "Another user has updated this ServicePopulation while you were editing")
                    render(view: "edit", model: [servicePopulationInstance: servicePopulationInstance])
                    return
                }
            }
            servicePopulationInstance.properties = params
            if (!servicePopulationInstance.hasErrors() && servicePopulationInstance.save(flush: true)) {
                flash.message = "servicePopulation.updated"
                flash.args = [params.id]
                flash.defaultMessage = "ServicePopulation ${params.id} updated"
                redirect(action: "show", id: servicePopulationInstance.id)
            } else {
                render(view: "edit", model: [servicePopulationInstance: servicePopulationInstance])
            }
        } else {
            flash.message = "servicePopulation.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ServicePopulation not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def servicePopulationInstance = ServicePopulation.get(params.id)
        if (servicePopulationInstance) {
            try {
                servicePopulationInstance.delete(flush: true)
                flash.message = "servicePopulation.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ServicePopulation ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "servicePopulation.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ServicePopulation ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "servicePopulation.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ServicePopulation not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def servicePopulationInstance = ServicePopulation.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def servicePopulationInstance = ServicePopulation.get(params.id)
    }
}
