package ru.gbuz.ao.privolgie.vocs

class ComputerAccessoryTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [computerAccessoryTypeInstanceList: ComputerAccessoryType.list(params), computerAccessoryTypeInstanceTotal: ComputerAccessoryType.count()]
    }

    def create = {
        def computerAccessoryTypeInstance = new ComputerAccessoryType()
        computerAccessoryTypeInstance.properties = params
        return [computerAccessoryTypeInstance: computerAccessoryTypeInstance]
    }

    def save = {
        def computerAccessoryTypeInstance = new ComputerAccessoryType(params)
        if (computerAccessoryTypeInstance.save(flush: true)) {
            flash.message = "computerAccessoryType.created"
            flash.args = [computerAccessoryTypeInstance.id]
            flash.defaultMessage = "ComputerAccessoryType ${computerAccessoryTypeInstance.id} created"
            redirect(action: "show", id: computerAccessoryTypeInstance.id)
        } else {
            render(view: "create", model: [computerAccessoryTypeInstance: computerAccessoryTypeInstance])
        }
    }

    def show = {
        def computerAccessoryTypeInstance = ComputerAccessoryType.get(params.id)
        if (!computerAccessoryTypeInstance) {
            flash.message = "computerAccessoryType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ComputerAccessoryType not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [computerAccessoryTypeInstance: computerAccessoryTypeInstance]
        }
    }

    def edit = {
        def computerAccessoryTypeInstance = ComputerAccessoryType.get(params.id)
        if (!computerAccessoryTypeInstance) {
            flash.message = "computerAccessoryType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ComputerAccessoryType not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [computerAccessoryTypeInstance: computerAccessoryTypeInstance]
        }
    }

    def update = {
        def computerAccessoryTypeInstance = ComputerAccessoryType.get(params.id)
        if (computerAccessoryTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (computerAccessoryTypeInstance.version > version) {

                    computerAccessoryTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'computerAccessoryType.label', default: 'ComputerAccessoryType')] as Object[], "Another user has updated this ComputerAccessoryType while you were editing")
                    render(view: "edit", model: [computerAccessoryTypeInstance: computerAccessoryTypeInstance])
                    return
                }
            }
            computerAccessoryTypeInstance.properties = params
            if (!computerAccessoryTypeInstance.hasErrors() && computerAccessoryTypeInstance.save(flush: true)) {
                flash.message = "computerAccessoryType.updated"
                flash.args = [params.id]
                flash.defaultMessage = "ComputerAccessoryType ${params.id} updated"
                redirect(action: "show", id: computerAccessoryTypeInstance.id)
            } else {
                render(view: "edit", model: [computerAccessoryTypeInstance: computerAccessoryTypeInstance])
            }
        } else {
            flash.message = "computerAccessoryType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ComputerAccessoryType not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def computerAccessoryTypeInstance = ComputerAccessoryType.get(params.id)
        if (computerAccessoryTypeInstance) {
            try {
                computerAccessoryTypeInstance.delete(flush: true)
                flash.message = "computerAccessoryType.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ComputerAccessoryType ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "computerAccessoryType.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ComputerAccessoryType ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "computerAccessoryType.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ComputerAccessoryType not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def computerAccessoryTypeInstance = ComputerAccessoryType.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def computerAccessoryTypeInstance = ComputerAccessoryType.get(params.id)
    }
}
