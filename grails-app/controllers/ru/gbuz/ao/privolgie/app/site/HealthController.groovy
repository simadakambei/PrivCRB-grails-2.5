package ru.gbuz.ao.privolgie.app.site

class HealthController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [healthInstanceList: Health.list(params), healthInstanceTotal: Health.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [healthInstanceList: Health.list(params), healthInstanceTotal: Health.count()]
    }

    def create = {
        def healthInstance = new Health()
        healthInstance.properties = params
        return [healthInstance: healthInstance]
    }

    def save = {
        def healthInstance = new Health(params)
        if (!healthInstance.hasErrors() && healthInstance.save()) {
            flash.message = "health.created"
            flash.args = [healthInstance.id]
            flash.defaultMessage = "Health ${healthInstance.id} created"
            redirect(action: "show", id: healthInstance.id)
        } else {
            render(view: "create", model: [healthInstance: healthInstance])
        }
    }

    def show = {
        def healthInstance = Health.get(params.id)
        if (!healthInstance) {
            flash.message = "health.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Health not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [healthInstance: healthInstance]
        }
    }

    def public_show = {
        def healthInstance = Health.get(params.id)
        if (!healthInstance) {
            flash.message = "health.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Health not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [healthInstance: healthInstance]
        }
    }

    def edit = {
        def healthInstance = Health.get(params.id)
        if (!healthInstance) {
            flash.message = "health.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Health not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [healthInstance: healthInstance]
        }
    }

    def update = {
        def healthInstance = Health.get(params.id)
        if (healthInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (healthInstance.version > version) {

                    healthInstance.errors.rejectValue("version", "health.optimistic.locking.failure", "Another user has updated this Health while you were editing")
                    render(view: "edit", model: [healthInstance: healthInstance])
                    return
                }
            }
            healthInstance.properties = params
            if (!healthInstance.hasErrors() && healthInstance.save()) {
                flash.message = "health.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Health ${params.id} updated"
                redirect(action: "show", id: healthInstance.id)
            } else {
                render(view: "edit", model: [healthInstance: healthInstance])
            }
        } else {
            flash.message = "health.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Health not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def healthInstance = Health.get(params.id)
        if (healthInstance) {
            try {
                healthInstance.delete()
                flash.message = "health.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Health ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "health.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Health ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "health.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Health not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
