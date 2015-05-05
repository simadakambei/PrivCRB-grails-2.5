package ru.gbuz.ao.privolgie.app.entity

import grails.converters.JSON

class LPUController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [LPUInstanceList: LPU.list(params), LPUInstanceTotal: LPU.count()]
    }

    def create = {
        def LPUInstance = new LPU()
        LPUInstance.properties = params
        return [LPUInstance: LPUInstance]
    }

    def save = {
        def LPUInstance = new LPU(params)
        if (LPUInstance.save(flush: true)) {
            flash.message = "LPU.created"
            flash.args = [LPUInstance.id]
            flash.defaultMessage = "LPU ${LPUInstance.id} created"
            redirect(action: "show", id: LPUInstance.id)
        } else {
            render(view: "create", model: [LPUInstance: LPUInstance])
        }
    }

    def show = {
        def LPUInstance = LPU.get(params.id)
        if (!LPUInstance) {
            flash.message = "LPU.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LPU not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [LPUInstance: LPUInstance]
        }
    }

    def public_show = {
        def LPUInstance = LPU.get(params.id)
        session.putValue("lpu", params.id)
        if (!LPUInstance) {
            flash.message = "LPU.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LPU not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [LPUInstance: LPUInstance]
        }
    }

    def addToMap = {
        def LPUInstance = LPU.get(session.getValue("lpu"))
        HashMap lpumap = new HashMap()
        if (LPUInstance) {
            lpumap.put("longitude", LPUInstance.longitude)
            lpumap.put("latitude", LPUInstance.latitude)
            lpumap.put("title", LPUInstance.title)
        }
        render lpumap as JSON
    }

    def edit = {
        def LPUInstance = LPU.get(params.id)
        if (!LPUInstance) {
            flash.message = "LPU.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LPU not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [LPUInstance: LPUInstance]
        }
    }

    def update = {
        def LPUInstance = LPU.get(params.id)
        if (LPUInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (LPUInstance.version > version) {

                    LPUInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'LPU.label', default: 'LPU')] as Object[], "Another user has updated this LPU while you were editing")
                    render(view: "edit", model: [LPUInstance: LPUInstance])
                    return
                }
            }
            LPUInstance.properties = params
            if (!LPUInstance.hasErrors() && LPUInstance.save(flush: true)) {
                flash.message = "LPU.updated"
                flash.args = [params.id]
                flash.defaultMessage = "LPU ${params.id} updated"
                redirect(action: "show", id: LPUInstance.id)
            } else {
                render(view: "edit", model: [LPUInstance: LPUInstance])
            }
        } else {
            flash.message = "LPU.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LPU not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def LPUInstance = LPU.get(params.id)
        if (LPUInstance) {
            try {
                LPUInstance.delete(flush: true)
                flash.message = "LPU.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "LPU ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "LPU.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "LPU ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "LPU.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LPU not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def LPUInstance = LPU.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def LPUInstance = LPU.get(params.id)
    }
}
