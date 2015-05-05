package ru.gbuz.ao.privolgie.security


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AuthorityController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Authority.list(params), model: [authorityInstanceCount: Authority.count()]
    }

    def show(Authority authorityInstance) {
        respond authorityInstance
    }

    def create() {
        respond new Authority(params)
    }

    @Transactional
    def save(Authority authorityInstance) {
        if (authorityInstance == null) {
            notFound()
            return
        }

        if (authorityInstance.hasErrors()) {
            respond authorityInstance.errors, view: 'create'
            return
        }

        authorityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'authority.show', default: 'Authority'), authorityInstance.id])
                redirect authorityInstance
            }
            '*' { respond authorityInstance, [status: CREATED] }
        }
    }

    def edit(Authority authorityInstance) {
        respond authorityInstance
    }

    @Transactional
    def update(Authority authorityInstance) {
        if (authorityInstance == null) {
            notFound()
            return
        }

        if (authorityInstance.hasErrors()) {
            respond authorityInstance.errors, view: 'edit'
            return
        }

        authorityInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'authority.show', default: 'Authority'), authorityInstance.id])
                redirect authorityInstance
            }
            '*' { respond authorityInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Authority authorityInstance) {

        if (authorityInstance == null) {
            notFound()
            return
        }

        authorityInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'authority.show', default: 'Authority'), authorityInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'authority.show', default: 'Authority'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def authorityInstance = Authority.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def authorityInstance = Authority.get(params.id)
    }

}
