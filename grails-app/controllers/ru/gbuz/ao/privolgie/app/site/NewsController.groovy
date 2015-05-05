package ru.gbuz.ao.privolgie.app.site

import ru.gbuz.ao.privolgie.security.Person

class NewsController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [newsInstanceList: News.list(params), newsInstanceTotal: News.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 5, 100)
        [newsInstanceList: News.list(params), newsInstanceTotal: News.count()]
    }

    def create = {
        def newsInstance = new News()
        newsInstance.properties = params
        return [newsInstance: newsInstance]
    }

    def save = {
        def newsInstance = new News(params)
        if (!newsInstance.hasErrors() && newsInstance.save(flush: true)) {
            flash.message = "news.created"
            flash.args = [newsInstance.id]
            flash.defaultMessage = "News ${newsInstance.id} created"
            redirect(action: "show", id: newsInstance.id)
        } else {
            render(view: "create", model: [newsInstance: newsInstance])
        }
    }

    def show = {
        def newsInstance = News.get(params.id)
        if (!newsInstance) {
            flash.message = "news.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "News not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [newsInstance: newsInstance]
        }
    }

    def public_show = {
        def newsInstance = News.get(params.id)
        if (!newsInstance) {
            flash.message = "news.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "News not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [newsInstance: newsInstance]
        }
    }

    def edit = {
        def newsInstance = News.get(params.id)
        if (!newsInstance) {
            flash.message = "news.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "News not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [newsInstance: newsInstance]
        }
    }

    def update = {
        def newsInstance = News.get(params.id)
        if (newsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (newsInstance.version > version) {

                    newsInstance.errors.rejectValue("version", "news.optimistic.locking.failure", "Another user has updated this News while you were editing")
                    render(view: "edit", model: [newsInstance: newsInstance])
                    return
                }
            }
            newsInstance.properties = params
            if (!newsInstance.hasErrors() && newsInstance.save()) {
                flash.message = "news.updated"
                flash.args = [params.id]
                flash.defaultMessage = "News ${params.id} updated"
                redirect(action: "show", id: newsInstance.id)
            } else {
                render(view: "edit", model: [newsInstance: newsInstance])
            }
        } else {
            flash.message = "news.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "News not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def newsInstance = News.get(params.id)
        if (newsInstance) {
            try {
                newsInstance.delete()
                flash.message = "news.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "News ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "news.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "News ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "news.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "News not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def newsInstance = News.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def newsInstance = News.get(params.id)
    }
}
