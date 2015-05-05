package ru.gbuz.ao.privolgie.vocs

class ServiceCommerceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [serviceCommerceInstanceList: ServiceCommerce.list(params), serviceCommerceInstanceTotal: ServiceCommerce.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [serviceCommerceInstanceList: ServiceCommerce.list(params), serviceCommerceInstanceTotal: ServiceCommerce.count()]
    }

    def create = {
        def serviceCommerceInstance = new ServiceCommerce()
        serviceCommerceInstance.properties = params
        return [serviceCommerceInstance: serviceCommerceInstance]
    }

    def save = {
        def serviceCommerceInstance = new ServiceCommerce(params)
        if (serviceCommerceInstance.save(flush: true)) {
            flash.message = "serviceCommerce.created"
            flash.args = [serviceCommerceInstance.id]
            flash.defaultMessage = "ServiceCommerce ${serviceCommerceInstance.id} created"
            redirect(action: "show", id: serviceCommerceInstance.id)
        } else {
            render(view: "create", model: [serviceCommerceInstance: serviceCommerceInstance])
        }
    }

    def show = {
        def serviceCommerceInstance = ServiceCommerce.get(params.id)
        if (!serviceCommerceInstance) {
            flash.message = "serviceCommerce.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ServiceCommerce not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [serviceCommerceInstance: serviceCommerceInstance]
        }
    }

    def edit = {
        def serviceCommerceInstance = ServiceCommerce.get(params.id)
        if (!serviceCommerceInstance) {
            flash.message = "serviceCommerce.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ServiceCommerce not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [serviceCommerceInstance: serviceCommerceInstance]
        }
    }

    def update = {
        def serviceCommerceInstance = ServiceCommerce.get(params.id)
        if (serviceCommerceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (serviceCommerceInstance.version > version) {

                    serviceCommerceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'serviceCommerce.label', default: 'ServiceCommerce')] as Object[], "Another user has updated this ServiceCommerce while you were editing")
                    render(view: "edit", model: [serviceCommerceInstance: serviceCommerceInstance])
                    return
                }
            }
            serviceCommerceInstance.properties = params
            if (!serviceCommerceInstance.hasErrors() && serviceCommerceInstance.save(flush: true)) {
                flash.message = "serviceCommerce.updated"
                flash.args = [params.id]
                flash.defaultMessage = "ServiceCommerce ${params.id} updated"
                redirect(action: "show", id: serviceCommerceInstance.id)
            } else {
                render(view: "edit", model: [serviceCommerceInstance: serviceCommerceInstance])
            }
        } else {
            flash.message = "serviceCommerce.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ServiceCommerce not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def serviceCommerceInstance = ServiceCommerce.get(params.id)
        if (serviceCommerceInstance) {
            try {
                serviceCommerceInstance.delete(flush: true)
                flash.message = "serviceCommerce.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ServiceCommerce ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "serviceCommerce.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ServiceCommerce ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "serviceCommerce.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ServiceCommerce not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def serviceCommerceInstance = ServiceCommerce.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def serviceCommerceInstance = ServiceCommerce.get(params.id)
    }
}
