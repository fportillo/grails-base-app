package br.com.almana.domain

import org.springframework.dao.DataIntegrityViolationException

class ContractController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contractInstanceList: Contract.list(params), contractInstanceTotal: Contract.count()]
    }

    def create() {
        [contractInstance: new Contract(params)]
    }

    private stampDate(contractInstance) {
        if(contractInstance) {
            contractInstance.creationDate = new Date()
        }
    }

    def save() {
        def contractInstance = new Contract(params)
        stampDate(contractInstance)
        if (!contractInstance.save(flush: true)) {
            render(view: "create", model: [contractInstance: contractInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contract.label', default: 'Contract'), contractInstance.id])
        redirect(action: "show", id: contractInstance.id)
    }

    def show(Long id) {
        def contractInstance = Contract.get(id)
        if (!contractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), id])
            redirect(action: "list")
            return
        }

        [contractInstance: contractInstance]
    }

    def edit(Long id) {
        def contractInstance = Contract.get(id)
        if (!contractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), id])
            redirect(action: "list")
            return
        }

        [contractInstance: contractInstance]
    }

    def update(Long id, Long version) {
        def contractInstance = Contract.get(id)
        if (!contractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contractInstance.version > version) {
                contractInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contract.label', default: 'Contract')] as Object[],
                          "Another user has updated this Contract while you were editing")
                render(view: "edit", model: [contractInstance: contractInstance])
                return
            }
        }

        contractInstance.properties = params
        stampDate(contractInstance)

        if (!contractInstance.save(flush: true)) {
            render(view: "edit", model: [contractInstance: contractInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contract.label', default: 'Contract'), contractInstance.id])
        redirect(action: "show", id: contractInstance.id)
    }

    def delete(Long id) {
        def contractInstance = Contract.get(id)
        if (!contractInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), id])
            redirect(action: "list")
            return
        }

        try {
            contractInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contract.label', default: 'Contract'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contract.label', default: 'Contract'), id])
            redirect(action: "show", id: id)
        }
    }
}
