package br.com.almana.domain



import org.junit.*
import grails.test.mixin.*

@TestFor(RequestMapController)
@Mock(RequestMap)
class RequestMapControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/requestMap/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.requestMapInstanceList.size() == 0
        assert model.requestMapInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.requestMapInstance != null
    }

    void testSave() {
        controller.save()

        assert model.requestMapInstance != null
        assert view == '/requestMap/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/requestMap/show/1'
        assert controller.flash.message != null
        assert RequestMap.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/requestMap/list'

        populateValidParams(params)
        def requestMap = new RequestMap(params)

        assert requestMap.save() != null

        params.id = requestMap.id

        def model = controller.show()

        assert model.requestMapInstance == requestMap
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/requestMap/list'

        populateValidParams(params)
        def requestMap = new RequestMap(params)

        assert requestMap.save() != null

        params.id = requestMap.id

        def model = controller.edit()

        assert model.requestMapInstance == requestMap
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/requestMap/list'

        response.reset()

        populateValidParams(params)
        def requestMap = new RequestMap(params)

        assert requestMap.save() != null

        // test invalid parameters in update
        params.id = requestMap.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/requestMap/edit"
        assert model.requestMapInstance != null

        requestMap.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/requestMap/show/$requestMap.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        requestMap.clearErrors()

        populateValidParams(params)
        params.id = requestMap.id
        params.version = -1
        controller.update()

        assert view == "/requestMap/edit"
        assert model.requestMapInstance != null
        assert model.requestMapInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/requestMap/list'

        response.reset()

        populateValidParams(params)
        def requestMap = new RequestMap(params)

        assert requestMap.save() != null
        assert RequestMap.count() == 1

        params.id = requestMap.id

        controller.delete()

        assert RequestMap.count() == 0
        assert RequestMap.get(requestMap.id) == null
        assert response.redirectedUrl == '/requestMap/list'
    }
}
