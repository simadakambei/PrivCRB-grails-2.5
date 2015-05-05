package ru.gbuz.ao.privolgie.app.site

class ArticleController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [articleInstanceList: Article.list(params), articleInstanceTotal: Article.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [articleInstanceList: Article.list(params), articleInstanceTotal: Article.count()]
    }

    def medical_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [articleInstanceList: Article.list(params), articleInstanceTotal: Article.count()]
    }

    def create = {
        def articleInstance = new Article()
        articleInstance.properties = params
        return [articleInstance: articleInstance]
    }

    def save = {
        def articleInstance = new Article(params)
        if (!articleInstance.hasErrors() && articleInstance.save()) {
            flash.message = "article.created"
            flash.args = [articleInstance.id]
            flash.defaultMessage = "Article ${articleInstance.id} created"
            redirect(action: "show", id: articleInstance.id)
        } else {
            render(view: "create", model: [articleInstance: articleInstance])
        }
    }

    def show = {
        def articleInstance = Article.get(params.id)
        if (!articleInstance) {
            flash.message = "article.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Article not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [articleInstance: articleInstance]
        }
    }

    def public_show = {
        def articleInstance = Article.get(params.id)
        if (!articleInstance) {
            flash.message = "article.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Article not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [articleInstance: articleInstance]
        }
    }

    def edit = {
        def articleInstance = Article.get(params.id)
        if (!articleInstance) {
            flash.message = "article.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Article not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [articleInstance: articleInstance]
        }
    }

    def update = {
        def articleInstance = Article.get(params.id)
        if (articleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (articleInstance.version > version) {

                    articleInstance.errors.rejectValue("version", "article.optimistic.locking.failure", "Another user has updated this Article while you were editing")
                    render(view: "edit", model: [articleInstance: articleInstance])
                    return
                }
            }
            articleInstance.properties = params
            if (!articleInstance.hasErrors() && articleInstance.save()) {
                flash.message = "article.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Article ${params.id} updated"
                redirect(action: "show", id: articleInstance.id)
            } else {
                render(view: "edit", model: [articleInstance: articleInstance])
            }
        } else {
            flash.message = "article.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Article not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def articleInstance = Article.get(params.id)
        if (articleInstance) {
            try {
                articleInstance.delete()
                flash.message = "article.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Article ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "article.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Article ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "article.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Article not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
