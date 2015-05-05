package ru.gbuz.ao.privolgie.app.entity

import grails.converters.JSON

class DepartmentUnitController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [departmentUnitInstanceList: DepartmentUnit.list(params), departmentUnitInstanceTotal: DepartmentUnit.count()]
    }

    def create = {
        def departmentUnitInstance = new DepartmentUnit()
        departmentUnitInstance.properties = params
        return [departmentUnitInstance: departmentUnitInstance]
    }

    def save = {
        def departmentUnitInstance = new DepartmentUnit(params)
        if (departmentUnitInstance.save(flush: true)) {
            flash.message = "departmentUnit.created"
            flash.args = [departmentUnitInstance.id]
            flash.defaultMessage = "DepartmentUnit ${departmentUnitInstance.id} created"
            redirect(action: "show", id: departmentUnitInstance.id)
        } else {
            render(view: "create", model: [departmentUnitInstance: departmentUnitInstance])
        }
    }

    def show = {
        def departmentUnitInstance = DepartmentUnit.get(params.id)
        if (!departmentUnitInstance) {
            flash.message = "departmentUnit.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "DepartmentUnit not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [departmentUnitInstance: departmentUnitInstance]
        }
    }

    def public_show = {
        def departmentUnitInstance = DepartmentUnit.get(params.id)
        session.putValue("departmentunit", params.id)
        if (!departmentUnitInstance) {
            flash.message = "departmentUnit.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "DepartmentUnit not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [departmentUnitInstance: departmentUnitInstance]
        }
    }

    def addToMap = {
        def departmentUnitInstance = DepartmentUnit.get(session.getValue("departmentunit"))
        HashMap departmentunitmap = new HashMap()
        if (departmentUnitInstance) {
            departmentunitmap.put("longitude", departmentUnitInstance.longitude)
            departmentunitmap.put("latitude", departmentUnitInstance.latitude)
            departmentunitmap.put("title", departmentUnitInstance.title)
        }
        render departmentunitmap as JSON
    }

    def edit = {
        def departmentUnitInstance = DepartmentUnit.get(params.id)
        if (!departmentUnitInstance) {
            flash.message = "departmentUnit.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "DepartmentUnit not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [departmentUnitInstance: departmentUnitInstance]
        }
    }

    def update = {
        def departmentUnitInstance = DepartmentUnit.get(params.id)
        if (departmentUnitInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (departmentUnitInstance.version > version) {

                    departmentUnitInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'departmentUnit.label', default: 'DepartmentUnit')] as Object[], "Another user has updated this DepartmentUnit while you were editing")
                    render(view: "edit", model: [departmentUnitInstance: departmentUnitInstance])
                    return
                }
            }
            departmentUnitInstance.properties = params
            if (!departmentUnitInstance.hasErrors() && departmentUnitInstance.save(flush: true)) {
                flash.message = "departmentUnit.updated"
                flash.args = [params.id]
                flash.defaultMessage = "DepartmentUnit ${params.id} updated"
                redirect(action: "show", id: departmentUnitInstance.id)
            } else {
                render(view: "edit", model: [departmentUnitInstance: departmentUnitInstance])
            }
        } else {
            flash.message = "departmentUnit.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "DepartmentUnit not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def departmentUnitInstance = DepartmentUnit.get(params.id)
        if (departmentUnitInstance) {
            try {
                departmentUnitInstance.delete(flush: true)
                flash.message = "departmentUnit.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "DepartmentUnit ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "departmentUnit.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "DepartmentUnit ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "departmentUnit.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "DepartmentUnit not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def departmentUnitInstance = DepartmentUnit.get(params.id)
        [departmentUnitInstance: departmentUnitInstance]
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def departmentUnitInstance = DepartmentUnit.get(params.id)
        [departmentUnitInstance: departmentUnitInstance]
    }
}
