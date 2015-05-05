package ru.gbuz.ao.privolgie.app.site

class QuestionController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [questionInstanceList: Question.list(params), questionInstanceTotal: Question.count()]
    }

    def getQuestionNotAnswersList(answers) {
        def criteria = Question.createCriteria()
        def result = criteria.list {
            isEmpty(answers)
        }
    }

    def getQuestionAnswersList(answers) {
        def criteria = Question.createCriteria()
        def result = criteria.list {
            isNotEmpty(answers)
        }
    }

    def public_list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        def questionNotAnswerList = getQuestionNotAnswersList("answers")
        def questionAnswerList = getQuestionAnswersList("answers")
        println(questionAnswerList)
        println(questionNotAnswerList)
        [questionInstanceList: Question.list(params), questionInstanceTotal: Question.count(), questionNotAnswerList: questionNotAnswerList, questionAnswerList: questionAnswerList]
    }

    def create = {
        def questionInstance = new Question()
        questionInstance.properties = params
        return [questionInstance: questionInstance]
    }

    def save = {
        def questionInstance = new Question(params)
        if (!questionInstance.hasErrors() && questionInstance.save()) {
            flash.message = "question.created"
            flash.args = [questionInstance.id]
            flash.defaultMessage = "Question ${questionInstance.id} created"
            redirect(action: "public_show", id: questionInstance.id)
        } else {
            render(view: "create", model: [questionInstance: questionInstance])
        }
    }

    def show = {
        def questionInstance = Question.get(params.id)
        def answers = questionInstance.answers.asList()
        if (!questionInstance) {
            flash.message = "question.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Question not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [questionInstance: questionInstance, answers: answers]
        }
    }

    def public_show = {
        def questionInstance = Question.get(params.id)
        if (!questionInstance) {
            flash.message = "question.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Question not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [questionInstance: questionInstance, answers: questionInstance?.answers]
        }
    }

    def edit = {
        def questionInstance = Question.get(params.id)
        if (!questionInstance) {
            flash.message = "question.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Question not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [questionInstance: questionInstance, answers: questionInstance?.answers]
        }
    }

    def update = {
        def questionInstance = Question.get(params.id)
        if (questionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (questionInstance.version > version) {

                    questionInstance.errors.rejectValue("version", "question.optimistic.locking.failure", "Another user has updated this Question while you were editing")
                    render(view: "edit", model: [questionInstance: questionInstance])
                    return
                }
            }
            questionInstance.properties = params
            if (!questionInstance.hasErrors() && questionInstance.save()) {
                flash.message = "question.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Question ${params.id} updated"
                redirect(action: "show", id: questionInstance.id)
            } else {
                render(view: "edit", model: [questionInstance: questionInstance])
            }
        } else {
            flash.message = "question.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Question not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def questionInstance = Question.get(params.id)
        if (questionInstance) {
            try {
                questionInstance.delete()
                flash.message = "question.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Question ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "question.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Question ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "question.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Question not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def questionInstance = Question.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def questionInstance = Question.get(params.id)
    }
}
