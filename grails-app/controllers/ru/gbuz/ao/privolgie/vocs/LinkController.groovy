package ru.gbuz.ao.privolgie.vocs

class LinkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [linkInstanceList: Link.list(params), linkInstanceTotal: Link.count()]
    }

    def create = {
        def linkInstance = new Link()
        linkInstance.properties = params
        return [linkInstance: linkInstance]
    }

    def save = {
        def linkInstance = new Link(params)
        if (linkInstance.save(flush: true)) {
            flash.message = "link.created"
            flash.args = [linkInstance.id]
            flash.defaultMessage = "Link ${linkInstance.id} created"
            redirect(action: "show", id: linkInstance.id)
        } else {
            render(view: "create", model: [linkInstance: linkInstance])
        }
    }

    def show = {
        def linkInstance = Link.get(params.id)
        if (!linkInstance) {
            flash.message = "link.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Link not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [linkInstance: linkInstance]
        }
    }

    def edit = {
        def linkInstance = Link.get(params.id)
        if (!linkInstance) {
            flash.message = "link.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Link not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [linkInstance: linkInstance]
        }
    }

    def update = {
        def linkInstance = Link.get(params.id)
        if (linkInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (linkInstance.version > version) {

                    linkInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'link.label', default: 'Link')] as Object[], "Another user has updated this Link while you were editing")
                    render(view: "edit", model: [linkInstance: linkInstance])
                    return
                }
            }
            linkInstance.properties = params
            if (!linkInstance.hasErrors() && linkInstance.save(flush: true)) {
                flash.message = "link.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Link ${params.id} updated"
                redirect(action: "show", id: linkInstance.id)
            } else {
                render(view: "edit", model: [linkInstance: linkInstance])
            }
        } else {
            flash.message = "link.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Link not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def linkInstance = Link.get(params.id)
        if (linkInstance) {
            try {
                linkInstance.delete(flush: true)
                flash.message = "link.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Link ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "link.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Link ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "link.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Link not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def linkInstance = Link.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def linkInstance = Link.get(params.id)
    }
}
