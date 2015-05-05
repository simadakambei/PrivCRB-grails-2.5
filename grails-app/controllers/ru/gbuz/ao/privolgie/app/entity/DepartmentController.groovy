package ru.gbuz.ao.privolgie.app.entity

import grails.converters.JSON
import org.codehaus.groovy.grails.web.util.WebUtils

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession

class DepartmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [departmentInstanceList: Department.list(params), departmentInstanceTotal: Department.count()]
    }

    def create = {
        def departmentInstance = new Department()
        departmentInstance.properties = params
        return [departmentInstance: departmentInstance]
    }

    def save = {
        def departmentInstance = new Department(params)
        if (departmentInstance.save(flush: true)) {
            flash.message = "department.created"
            flash.args = [departmentInstance.id]
            flash.defaultMessage = "Department ${departmentInstance.id} created"
            redirect(action: "show", id: departmentInstance.id)
        } else {
            render(view: "create", model: [departmentInstance: departmentInstance])
        }
    }

    def show = {
        def departmentInstance = Department.get(params.id)
        if (!departmentInstance) {
            flash.message = "department.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Department not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [departmentInstance: departmentInstance]
        }
    }

    def public_show = {
        def departmentInstance = Department.get(params.id)
        HttpServletRequest request = WebUtils.retrieveGrailsWebRequest().currentRequest
        HttpSession session = request.session
        session.putValue("department", params.id)
        println session.getValue("department")
        if (!departmentInstance) {
            flash.message = "department.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Department not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [departmentInstance: departmentInstance]
        }
    }

    def addToMap = {
        def departmentInstance = Department.get(session.getValue("department"))
        println departmentInstance.latitude
        HashMap departmentmap = new HashMap()
        if (departmentInstance) {
            departmentmap.put("longitude", departmentInstance.longitude)
            departmentmap.put("latitude", departmentInstance.latitude)
            departmentmap.put("title", departmentInstance.title)
        }
        render departmentmap as JSON
    }

    def edit = {
        def departmentInstance = Department.get(params.id)
        if (!departmentInstance) {
            flash.message = "department.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Department not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [departmentInstance: departmentInstance]
        }
    }

    def update = {
        def departmentInstance = Department.get(params.id)
        if (departmentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (departmentInstance.version > version) {

                    departmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'department.label', default: 'Department')] as Object[], "Another user has updated this Department while you were editing")
                    render(view: "edit", model: [departmentInstance: departmentInstance])
                    return
                }
            }
            departmentInstance.properties = params
            if (!departmentInstance.hasErrors() && departmentInstance.save(flush: true)) {
                flash.message = "department.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Department ${params.id} updated"
                redirect(action: "show", id: departmentInstance.id)
            } else {
                render(view: "edit", model: [departmentInstance: departmentInstance])
            }
        } else {
            flash.message = "department.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Department not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def departmentInstance = Department.get(params.id)
        if (departmentInstance) {
            try {
                departmentInstance.delete(flush: true)
                flash.message = "department.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Department ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "department.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Department ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "department.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Department not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def departmentInstance = Department.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def departmentInstance = Department.get(params.id)
    }
}
