package ru.gbuz.ao.privolgie.app.site

class AnswerToRequestAnAppealController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [answerToRequestAnAppealInstanceList: AnswerToRequestAnAppeal.list(params), answerToRequestAnAppealInstanceTotal: AnswerToRequestAnAppeal.count()]
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [answerToRequestAnAppealInstanceList: AnswerToRequestAnAppeal.list(params), answerToRequestAnAppealInstanceTotal: AnswerToRequestAnAppeal.count()]
    }

    def create = {
        def answerToRequestAnAppealInstance = new AnswerToRequestAnAppeal()
        answerToRequestAnAppealInstance.properties = params
        return [answerToRequestAnAppealInstance: answerToRequestAnAppealInstance]
    }

    def save = {
        def answerToRequestAnAppealInstance = new AnswerToRequestAnAppeal(params)
        if (!answerToRequestAnAppealInstance.hasErrors() && answerToRequestAnAppealInstance.save()) {
            flash.message = "answerToRequestAnAppeal.created"
            flash.args = [answerToRequestAnAppealInstance.id]
            flash.defaultMessage = "AnswerToRequestAnAppeal ${answerToRequestAnAppealInstance.id} created"
            redirect(action: "show", id: answerToRequestAnAppealInstance.id)
        } else {
            render(view: "create", model: [answerToRequestAnAppealInstance: answerToRequestAnAppealInstance])
        }
    }

    def show = {
        def answerToRequestAnAppealInstance = AnswerToRequestAnAppeal.get(params.id)
        if (!answerToRequestAnAppealInstance) {
            flash.message = "answerToRequestAnAppeal.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "AnswerToRequestAnAppeal not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [answerToRequestAnAppealInstance: answerToRequestAnAppealInstance]
        }
    }

    def public_show = {
        def answerToRequestAnAppealInstance = AnswerToRequestAnAppeal.get(params.id)
        if (!answerToRequestAnAppealInstance) {
            flash.message = "answerToRequestAnAppeal.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "AnswerToRequestAnAppeal not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [answerToRequestAnAppealInstance: answerToRequestAnAppealInstance]
        }
    }

    def edit = {
        def answerToRequestAnAppealInstance = AnswerToRequestAnAppeal.get(params.id)
        if (!answerToRequestAnAppealInstance) {
            flash.message = "answerToRequestAnAppeal.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "AnswerToRequestAnAppeal not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [answerToRequestAnAppealInstance: answerToRequestAnAppealInstance]
        }
    }

    def update = {
        def answerToRequestAnAppealInstance = AnswerToRequestAnAppeal.get(params.id)
        if (answerToRequestAnAppealInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (answerToRequestAnAppealInstance.version > version) {

                    answerToRequestAnAppealInstance.errors.rejectValue("version", "answerToRequestAnAppeal.optimistic.locking.failure", "Another user has updated this AnswerToRequestAnAppeal while you were editing")
                    render(view: "edit", model: [answerToRequestAnAppealInstance: answerToRequestAnAppealInstance])
                    return
                }
            }
            answerToRequestAnAppealInstance.properties = params
            if (!answerToRequestAnAppealInstance.hasErrors() && answerToRequestAnAppealInstance.save()) {
                flash.message = "answerToRequestAnAppeal.updated"
                flash.args = [params.id]
                flash.defaultMessage = "AnswerToRequestAnAppeal ${params.id} updated"
                redirect(action: "show", id: answerToRequestAnAppealInstance.id)
            } else {
                render(view: "edit", model: [answerToRequestAnAppealInstance: answerToRequestAnAppealInstance])
            }
        } else {
            flash.message = "answerToRequestAnAppeal.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "AnswerToRequestAnAppeal not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def answerToRequestAnAppealInstance = AnswerToRequestAnAppeal.get(params.id)
        if (answerToRequestAnAppealInstance) {
            try {
                answerToRequestAnAppealInstance.delete()
                flash.message = "answerToRequestAnAppeal.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "AnswerToRequestAnAppeal ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "answerToRequestAnAppeal.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "AnswerToRequestAnAppeal ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "answerToRequestAnAppeal.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "AnswerToRequestAnAppeal not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def answerToRequestAnAppealInstance = AnswerToRequestAnAppeal.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def answerToRequestAnAppealInstance = AnswerToRequestAnAppeal.get(params.id)
    }
}
