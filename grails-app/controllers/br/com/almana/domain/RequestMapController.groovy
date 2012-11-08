package br.com.almana.domain

import org.springframework.dao.DataIntegrityViolationException

class RequestMapController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [requestMapInstanceList: RequestMap.list(params), requestMapInstanceTotal: RequestMap.count()]
    }

    def create() {
        [requestMapInstance: new RequestMap(params)]
    }

    def save() {
        def requestMapInstance = new RequestMap(params)
        if (!requestMapInstance.save(flush: true)) {
            render(view: "create", model: [requestMapInstance: requestMapInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'requestMap.label', default: 'RequestMap'), requestMapInstance.id])
        redirect(action: "show", id: requestMapInstance.id)
    }

    def show(Long id) {
        def requestMapInstance = RequestMap.get(id)
        if (!requestMapInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestMap.label', default: 'RequestMap'), id])
            redirect(action: "list")
            return
        }

        [requestMapInstance: requestMapInstance]
    }

    def edit(Long id) {
        def requestMapInstance = RequestMap.get(id)
        if (!requestMapInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestMap.label', default: 'RequestMap'), id])
            redirect(action: "list")
            return
        }

        [requestMapInstance: requestMapInstance]
    }

    def update(Long id, Long version) {
        def requestMapInstance = RequestMap.get(id)
        if (!requestMapInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestMap.label', default: 'RequestMap'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (requestMapInstance.version > version) {
                requestMapInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'requestMap.label', default: 'RequestMap')] as Object[],
                          "Another user has updated this RequestMap while you were editing")
                render(view: "edit", model: [requestMapInstance: requestMapInstance])
                return
            }
        }

        requestMapInstance.properties = params

        if (!requestMapInstance.save(flush: true)) {
            render(view: "edit", model: [requestMapInstance: requestMapInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'requestMap.label', default: 'RequestMap'), requestMapInstance.id])
        redirect(action: "show", id: requestMapInstance.id)
    }

    def delete(Long id) {
        def requestMapInstance = RequestMap.get(id)
        if (!requestMapInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'requestMap.label', default: 'RequestMap'), id])
            redirect(action: "list")
            return
        }

        try {
            requestMapInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'requestMap.label', default: 'RequestMap'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'requestMap.label', default: 'RequestMap'), id])
            redirect(action: "show", id: id)
        }
    }
}
