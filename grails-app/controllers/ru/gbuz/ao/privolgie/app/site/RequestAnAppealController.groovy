package ru.gbuz.ao.privolgie.app.site

class RequestAnAppealController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [requestAnAppealInstanceList: RequestAnAppeal.list(params), requestAnAppealInstanceTotal: RequestAnAppeal.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [requestAnAppealInstanceList: RequestAnAppeal.list(params), requestAnAppealInstanceTotal: RequestAnAppeal.count()]
    }

    def create = {
        def requestAnAppealInstance = new RequestAnAppeal()
        requestAnAppealInstance.requestDate = new Date().toTimestamp()
        requestAnAppealInstance.properties = params

        println(params.requestDate)
        return [requestAnAppealInstance: requestAnAppealInstance]
    }

    def save = {
        params.requestDate = new Date().toTimestamp()
        def requestAnAppealInstance = new RequestAnAppeal(params)
        if (!requestAnAppealInstance.hasErrors() && requestAnAppealInstance.save()) {
            flash.message = "requestAnAppeal.created"
            flash.args = [requestAnAppealInstance.id]
            flash.defaultMessage = "RequestAnAppeal ${requestAnAppealInstance.id} created"
            redirect(action: "public_show", id: requestAnAppealInstance.id)
        } else {
            render(view: "create", model: [requestAnAppealInstance: requestAnAppealInstance])
        }
    }

    def show = {
        def requestAnAppealInstance = RequestAnAppeal.get(params.id)
        if (!requestAnAppealInstance) {
            flash.message = "requestAnAppeal.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "RequestAnAppeal not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [requestAnAppealInstance: requestAnAppealInstance]
        }
    }

    def public_show = {
        def requestAnAppealInstance = RequestAnAppeal.get(params.id)
        if (!requestAnAppealInstance) {
            flash.message = "requestAnAppeal.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "RequestAnAppeal not found with id ${params.id}"
            redirect(action: "public_list")
        } else {
            return [requestAnAppealInstance: requestAnAppealInstance]
        }
    }

    def edit = {
        def requestAnAppealInstance = RequestAnAppeal.get(params.id)
        if (!requestAnAppealInstance) {
            flash.message = "requestAnAppeal.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "RequestAnAppeal not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [requestAnAppealInstance: requestAnAppealInstance]
        }
    }

    def update = {
        def requestAnAppealInstance = RequestAnAppeal.get(params.id)
        if (requestAnAppealInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (requestAnAppealInstance.version > version) {

                    requestAnAppealInstance.errors.rejectValue("version", "requestAnAppeal.optimistic.locking.failure", "Another user has updated this RequestAnAppeal while you were editing")
                    render(view: "edit", model: [requestAnAppealInstance: requestAnAppealInstance])
                    return
                }
            }
            requestAnAppealInstance.properties = params
            if (!requestAnAppealInstance.hasErrors() && requestAnAppealInstance.save()) {
                flash.message = "requestAnAppeal.updated"
                flash.args = [params.id]
                flash.defaultMessage = "RequestAnAppeal ${params.id} updated"
                redirect(action: "show", id: requestAnAppealInstance.id)
            } else {
                render(view: "edit", model: [requestAnAppealInstance: requestAnAppealInstance])
            }
        } else {
            flash.message = "requestAnAppeal.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "RequestAnAppeal not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def requestAnAppealInstance = RequestAnAppeal.get(params.id)
        if (requestAnAppealInstance) {
            try {
                requestAnAppealInstance.delete()
                flash.message = "requestAnAppeal.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "RequestAnAppeal ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "requestAnAppeal.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "RequestAnAppeal ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "requestAnAppeal.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "RequestAnAppeal not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def requestAnAppealInstance = RequestAnAppeal.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def requestAnAppealInstance = RequestAnAppeal.get(params.id)
    }
}
