package ru.gbuz.ao.privolgie.app.site

class AboutController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def last = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def about = About.findAllByVisible(true)
        [about: about]
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [aboutInstanceList: About.list(params), aboutInstanceTotal: About.count()]
    }

    def create = {
        def aboutInstance = new About()
        aboutInstance.properties = params
        return [aboutInstance: aboutInstance]
    }

    def save = {
        def aboutInstance = new About(params)
        if (aboutInstance.save(flush: true)) {
            flash.message = "about.created"
            flash.args = [aboutInstance.id]
            flash.defaultMessage = "About ${aboutInstance.id} created"
            redirect(action: "show", id: aboutInstance.id)
        } else {
            render(view: "create", model: [aboutInstance: aboutInstance])
        }
    }

    def show = {
        def aboutInstance = About.get(params.id)
        if (!aboutInstance) {
            flash.message = "about.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "About not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [aboutInstance: aboutInstance]
        }
    }

    def edit = {
        def aboutInstance = About.get(params.id)
        if (!aboutInstance) {
            flash.message = "about.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "About not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [aboutInstance: aboutInstance]
        }
    }

    def update = {
        def aboutInstance = About.get(params.id)
        if (aboutInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (aboutInstance.version > version) {

                    aboutInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'about.label', default: 'About')] as Object[], "Another user has updated this About while you were editing")
                    render(view: "edit", model: [aboutInstance: aboutInstance])
                    return
                }
            }
            aboutInstance.properties = params
            if (!aboutInstance.hasErrors() && aboutInstance.save(flush: true)) {
                flash.message = "${message(code: 'about.updated', args: [params.id])}"
                flash.args = [params.id]
                flash.defaultMessage = "${message(code: 'about.updated')}"
                redirect(action: "show", id: aboutInstance.id)
            } else {
                render(view: "edit", model: [aboutInstance: aboutInstance])
            }
        } else {
            flash.message = "about.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "About not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def aboutInstance = About.get(params.id)
        if (aboutInstance) {
            try {
                aboutInstance.delete(flush: true)
                flash.message = "about.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "About ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "about.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "About ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "about.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "About not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def aboutInstance = About.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def aboutInstance = About.get(params.id)
    }
}
