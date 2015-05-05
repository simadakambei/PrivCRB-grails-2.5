package ru.gbuz.ao.privolgie.vocs

class OfficialPostController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [officialPostInstanceList: OfficialPost.list(params), officialPostInstanceTotal: OfficialPost.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [officialPostInstanceList: OfficialPost.list(params), officialPostInstanceTotal: OfficialPost.count()]
    }

    def create = {
        def officialPostInstance = new OfficialPost()
        officialPostInstance.properties = params
        return [officialPostInstance: officialPostInstance]
    }

    def save = {
        def officialPostInstance = new OfficialPost(params)
        if (!officialPostInstance.hasErrors() && officialPostInstance.save()) {
            flash.message = "officialPost.created"
            flash.args = [officialPostInstance.id]
            flash.defaultMessage = "OfficialPost ${officialPostInstance.id} created"
            redirect(action: "show", id: officialPostInstance.id)
        } else {
            render(view: "create", model: [officialPostInstance: officialPostInstance])
        }
    }

    def show = {
        def officialPostInstance = OfficialPost.get(params.id)
        if (!officialPostInstance) {
            flash.message = "officialPost.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "OfficialPost not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [officialPostInstance: officialPostInstance]
        }
    }

    def public_show = {
        def officialPostInstance = OfficialPost.get(params.id)
        if (!officialPostInstance) {
            flash.message = "officialPost.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "OfficialPost not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [officialPostInstance: officialPostInstance]
        }
    }

    def edit = {
        def officialPostInstance = OfficialPost.get(params.id)
        if (!officialPostInstance) {
            flash.message = "officialPost.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "OfficialPost not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [officialPostInstance: officialPostInstance]
        }
    }

    def update = {
        def officialPostInstance = OfficialPost.get(params.id)
        if (officialPostInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (officialPostInstance.version > version) {

                    officialPostInstance.errors.rejectValue("version", "officialPost.optimistic.locking.failure", "Another user has updated this OfficialPost while you were editing")
                    render(view: "edit", model: [officialPostInstance: officialPostInstance])
                    return
                }
            }
            officialPostInstance.properties = params
            if (!officialPostInstance.hasErrors() && officialPostInstance.save()) {
                flash.message = "officialPost.updated"
                flash.args = [params.id]
                flash.defaultMessage = "OfficialPost ${params.id} updated"
                redirect(action: "show", id: officialPostInstance.id)
            } else {
                render(view: "edit", model: [officialPostInstance: officialPostInstance])
            }
        } else {
            flash.message = "officialPost.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "OfficialPost not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def officialPostInstance = OfficialPost.get(params.id)
        if (officialPostInstance) {
            try {
                officialPostInstance.delete()
                flash.message = "officialPost.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "OfficialPost ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "officialPost.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "OfficialPost ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "officialPost.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "OfficialPost not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def officialPostInstance = OfficialPost.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def officialPostInstance = OfficialPost.get(params.id)
    }
}
