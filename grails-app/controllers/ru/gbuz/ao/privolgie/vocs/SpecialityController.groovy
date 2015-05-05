package ru.gbuz.ao.privolgie.vocs

class SpecialityController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [specialityInstanceList: Speciality.list(params), specialityInstanceTotal: Speciality.count()]
    }

    def create = {
        def specialityInstance = new Speciality()
        specialityInstance.properties = params
        return [specialityInstance: specialityInstance]
    }

    def save = {
        def specialityInstance = new Speciality(params)
        if (!specialityInstance.hasErrors() && specialityInstance.save()) {
            flash.message = "speciality.created"
            flash.args = [specialityInstance.id]
            flash.defaultMessage = "Speciality ${specialityInstance.id} created"
            redirect(action: "show", id: specialityInstance.id)
        } else {
            render(view: "create", model: [specialityInstance: specialityInstance])
        }
    }

    def show = {
        def specialityInstance = Speciality.get(params.id)
        if (!specialityInstance) {
            flash.message = "speciality.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Speciality not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [specialityInstance: specialityInstance]
        }
    }

    def edit = {
        def specialityInstance = Speciality.get(params.id)
        if (!specialityInstance) {
            flash.message = "speciality.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Speciality not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [specialityInstance: specialityInstance]
        }
    }

    def update = {
        def specialityInstance = Speciality.get(params.id)
        if (specialityInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (specialityInstance.version > version) {

                    specialityInstance.errors.rejectValue("version", "speciality.optimistic.locking.failure", "Another user has updated this Speciality while you were editing")
                    render(view: "edit", model: [specialityInstance: specialityInstance])
                    return
                }
            }
            specialityInstance.properties = params
            if (!specialityInstance.hasErrors() && specialityInstance.save()) {
                flash.message = "speciality.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Speciality ${params.id} updated"
                redirect(action: "show", id: specialityInstance.id)
            } else {
                render(view: "edit", model: [specialityInstance: specialityInstance])
            }
        } else {
            flash.message = "speciality.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Speciality not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def specialityInstance = Speciality.get(params.id)
        if (specialityInstance) {
            try {
                specialityInstance.delete()
                flash.message = "speciality.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Speciality ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "speciality.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Speciality ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "speciality.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Speciality not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def specialityInstance = Speciality.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def specialityInstance = Speciality.get(params.id)
    }
}
