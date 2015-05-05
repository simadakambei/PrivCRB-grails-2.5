package ru.gbuz.ao.privolgie.app.inventory

class ComputerAccessoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [computerAccessoryInstanceList: ComputerAccessory.list(params), computerAccessoryInstanceTotal: ComputerAccessory.count()]
    }

    def create = {
        def computerAccessoryInstance = new ComputerAccessory()
        computerAccessoryInstance.properties = params
        return [computerAccessoryInstance: computerAccessoryInstance]
    }

    def save = {
        def computerAccessoryInstance = new ComputerAccessory(params)
        if (computerAccessoryInstance.save(flush: true)) {
            flash.message = "computerAccessory.created"
            flash.args = [computerAccessoryInstance.id]
            flash.defaultMessage = "ComputerAccessory ${computerAccessoryInstance.id} created"
            redirect(action: "show", id: computerAccessoryInstance.id)
        } else {
            render(view: "create", model: [computerAccessoryInstance: computerAccessoryInstance])
        }
    }

    def show = {
        def computerAccessoryInstance = ComputerAccessory.get(params.id)
        if (!computerAccessoryInstance) {
            flash.message = "computerAccessory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ComputerAccessory not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [computerAccessoryInstance: computerAccessoryInstance]
        }
    }

    def public_show = {
        def computerAccessoryInstance = ComputerAccessory.get(params.id)
        if (!computerAccessoryInstance) {
            flash.message = "computerAccessory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ComputerAccessory not found with id ${params.id}"
            redirect(action: "list")
        } else {
            [computerAccessoryInstance: computerAccessoryInstance]
        }
    }

    def edit = {
        def computerAccessoryInstance = ComputerAccessory.get(params.id)
        if (!computerAccessoryInstance) {
            flash.message = "computerAccessory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ComputerAccessory not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [computerAccessoryInstance: computerAccessoryInstance]
        }
    }

    def update = {
        def computerAccessoryInstance = ComputerAccessory.get(params.id)
        if (computerAccessoryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (computerAccessoryInstance.version > version) {

                    computerAccessoryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'computerAccessory.label', default: 'ComputerAccessory')] as Object[], "Another user has updated this ComputerAccessory while you were editing")
                    render(view: "edit", model: [computerAccessoryInstance: computerAccessoryInstance])
                    return
                }
            }
            computerAccessoryInstance.properties = params
            if (!computerAccessoryInstance.hasErrors() && computerAccessoryInstance.save(flush: true)) {
                flash.message = "computerAccessory.updated"
                flash.args = [params.id]
                flash.defaultMessage = "ComputerAccessory ${params.id} updated"
                redirect(action: "show", id: computerAccessoryInstance.id)
            } else {
                render(view: "edit", model: [computerAccessoryInstance: computerAccessoryInstance])
            }
        } else {
            flash.message = "computerAccessory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ComputerAccessory not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def delete = {
        def computerAccessoryInstance = ComputerAccessory.get(params.id)
        if (computerAccessoryInstance) {
            try {
                computerAccessoryInstance.delete(flush: true)
                flash.message = "computerAccessory.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ComputerAccessory ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "computerAccessory.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "ComputerAccessory ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "computerAccessory.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "ComputerAccessory not found with id ${params.id}"
            redirect(action: "list")
        }
    }

    def edit_admin = {
        render(view: 'edit_admin')
        def computerAccessoryInstance = ComputerAccessory.get(params.id)
    }

    def delete_admin = {
        render(view: 'delete_admin')
        def computerAccessoryInstance = ComputerAccessory.get(params.id)
    }

    def add = {
        def computerAccessoryInstance = ComputerAccessory.get(params.id)
        def systemUnitInstance = SystemUnit.get(params.systemUnit)
        systemUnitInstance.addToAccessories(computerAccessoryInstance)
    }
}
