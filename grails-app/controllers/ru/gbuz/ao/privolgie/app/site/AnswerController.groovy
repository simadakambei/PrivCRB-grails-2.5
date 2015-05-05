package ru.gbuz.ao.privolgie.app.site

class AnswerController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [answerInstanceList: Answer.list(params), answerInstanceTotal: Answer.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [answerInstanceList: Answer.list(params), answerInstanceTotal: Answer.count()]
    }

    def create = {
        def answerInstance = new Answer()
        answerInstance.properties = params
        return [answerInstance: answerInstance]
    }

    def save = {
        def answerInstance = new Answer(params)
        if (!answerInstance.hasErrors() && answerInstance.save()) {

            flash.message = "answer.created"
            flash.args = [answerInstance.id]
            flash.defaultMessage = "Answer ${answerInstance.id} created"
            redirect(action: "show", id: answerInstance.id)
        } else {
            render(view: "create", model: [answerInstance: answerInstance])
        }
    }

    def show = {
        def answerInstance = Answer.get(params.id)
        if (!answerInstance) {
            flash.message = "answer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Answer not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [answerInstance: answerInstance]
        }
    }

    def public_show = {
        def answerInstance = Answer.get(params.id)
        if (!answerInstance) {
            flash.message = "answer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Answer not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [answerInstance: answerInstance]
        }
    }

    def edit = {
        def answerInstance = Answer.get(params.id)
        if (!answerInstance) {
            flash.message = "answer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Answer not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [answerInstance: answerInstance]
        }
    }

    def update = {
        def answerInstance = Answer.get(params.id)
        if (answerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (answerInstance.version > version) {

                    answerInstance.errors.rejectValue("version", "answer.optimistic.locking.failure", "Another user has updated this Answer while you were editing")
                    render(view: "edit", model: [answerInstance: answerInstance])
                    return
                }
            }
            answerInstance.properties = params
            if (!answerInstance.hasErrors() && answerInstance.save()) {
                flash.message = "answer.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Answer ${params.id} updated"
                redirect(action: "show", id: answerInstance.id)
            } else {
                render(view: "edit", model: [answerInstance: answerInstance])
            }
        } else {
            flash.message = "answer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Answer not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def answerInstance = Answer.get(params.id)
        if (answerInstance) {
            try {
                answerInstance.delete()
                flash.message = "answer.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Answer ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "answer.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Answer ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "answer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Answer not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def answerInstance = Answer.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def answerInstance = Answer.get(params.id)
    }
}
