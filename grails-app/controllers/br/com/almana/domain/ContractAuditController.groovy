package br.com.almana.domain

import org.springframework.dao.DataIntegrityViolationException

class ContractAuditController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contractAuditInstanceList: ContractAudit.list(params), contractAuditInstanceTotal: ContractAudit.count()]
    }

    def create() {
        [contractAuditInstance: new ContractAudit(params)]
    }

    def save() {
        def contractAuditInstance = new ContractAudit(params)
        if (!contractAuditInstance.save(flush: true)) {
            render(view: "create", model: [contractAuditInstance: contractAuditInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contractAudit.label', default: 'ContractAudit'), contractAuditInstance.id])
        redirect(action: "show", id: contractAuditInstance.id)
    }

    def show(Long id) {
        def contractAuditInstance = ContractAudit.get(id)
        if (!contractAuditInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contractAudit.label', default: 'ContractAudit'), id])
            redirect(action: "list")
            return
        }

        [contractAuditInstance: contractAuditInstance]
    }

    def edit(Long id) {
        def contractAuditInstance = ContractAudit.get(id)
        if (!contractAuditInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contractAudit.label', default: 'ContractAudit'), id])
            redirect(action: "list")
            return
        }

        [contractAuditInstance: contractAuditInstance]
    }

    def update(Long id, Long version) {
        def contractAuditInstance = ContractAudit.get(id)
        if (!contractAuditInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contractAudit.label', default: 'ContractAudit'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contractAuditInstance.version > version) {
                contractAuditInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contractAudit.label', default: 'ContractAudit')] as Object[],
                          "Another user has updated this ContractAudit while you were editing")
                render(view: "edit", model: [contractAuditInstance: contractAuditInstance])
                return
            }
        }

        contractAuditInstance.properties = params

        if (!contractAuditInstance.save(flush: true)) {
            render(view: "edit", model: [contractAuditInstance: contractAuditInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contractAudit.label', default: 'ContractAudit'), contractAuditInstance.id])
        redirect(action: "show", id: contractAuditInstance.id)
    }

    def delete(Long id) {
        def contractAuditInstance = ContractAudit.get(id)
        if (!contractAuditInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contractAudit.label', default: 'ContractAudit'), id])
            redirect(action: "list")
            return
        }

        try {
            contractAuditInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contractAudit.label', default: 'ContractAudit'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contractAudit.label', default: 'ContractAudit'), id])
            redirect(action: "show", id: id)
        }
    }
}
