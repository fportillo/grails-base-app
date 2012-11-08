
<%@ page import="br.com.almana.domain.Contract" %>
<!doctype html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-contract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-contract" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list contract">
                <g:if test="${contractInstance?.text}">
                    <li class="fieldcontain">
                        <span id="text-label" class="property-label">
                            <g:message code="contract.text.label" default="Text" />
                        </span>
                        <span class="property-value" aria-labelledby="text-label">
                            ${contractInstance?.text?.decodeHTML()}
                        </span>
                    </li>
                </g:if>

                <g:if test="${contractInstance?.creationDate}">
                <li class="fieldcontain">
                    <span id="creationDate-label" class="property-label"><g:message code="contract.creationDate.label" default="Creation Date" /></span>

                        <span class="property-value" aria-labelledby="creationDate-label"><g:formatDate date="${contractInstance?.creationDate}" /></span>

                </li>
                </g:if>

                <g:if test="${contractInstance?.enabled}">
                <li class="fieldcontain">
                    <span id="enabled-label" class="property-label"><g:message code="contract.enabled.label" default="Enabled" /></span>

                        <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${contractInstance?.enabled}" /></span>

                </li>
                </g:if>

            </ol>
            <g:form>
                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${contractInstance?.id}" />
                    <g:link class="edit" action="edit" id="${contractInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
