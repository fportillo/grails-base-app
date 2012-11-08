package br.com.almana.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(ContractAuditController)
@Mock(ContractAudit)
class ContractAuditControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contractAudit/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contractAuditInstanceList.size() == 0
        assert model.contractAuditInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.contractAuditInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contractAuditInstance != null
        assert view == '/contractAudit/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contractAudit/show/1'
        assert controller.flash.message != null
        assert ContractAudit.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contractAudit/list'

        populateValidParams(params)
        def contractAudit = new ContractAudit(params)

        assert contractAudit.save() != null

        params.id = contractAudit.id

        def model = controller.show()

        assert model.contractAuditInstance == contractAudit
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contractAudit/list'

        populateValidParams(params)
        def contractAudit = new ContractAudit(params)

        assert contractAudit.save() != null

        params.id = contractAudit.id

        def model = controller.edit()

        assert model.contractAuditInstance == contractAudit
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contractAudit/list'

        response.reset()

        populateValidParams(params)
        def contractAudit = new ContractAudit(params)

        assert contractAudit.save() != null

        // test invalid parameters in update
        params.id = contractAudit.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contractAudit/edit"
        assert model.contractAuditInstance != null

        contractAudit.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contractAudit/show/$contractAudit.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contractAudit.clearErrors()

        populateValidParams(params)
        params.id = contractAudit.id
        params.version = -1
        controller.update()

        assert view == "/contractAudit/edit"
        assert model.contractAuditInstance != null
        assert model.contractAuditInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contractAudit/list'

        response.reset()

        populateValidParams(params)
        def contractAudit = new ContractAudit(params)

        assert contractAudit.save() != null
        assert ContractAudit.count() == 1

        params.id = contractAudit.id

        controller.delete()

        assert ContractAudit.count() == 0
        assert ContractAudit.get(contractAudit.id) == null
        assert response.redirectedUrl == '/contractAudit/list'
    }
}
