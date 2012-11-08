
<%@ page import="br.com.almana.domain.ContractAudit" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contractAudit.label', default: 'ContractAudit')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contractAudit" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contractAudit" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contractAudit">
			
				<g:if test="${contractAuditInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="contractAudit.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${contractAuditInstance?.user?.id}">${contractAuditInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractAuditInstance?.contract}">
				<li class="fieldcontain">
					<span id="contract-label" class="property-label"><g:message code="contractAudit.contract.label" default="Contract" /></span>
					
						<span class="property-value" aria-labelledby="contract-label"><g:link controller="contract" action="show" id="${contractAuditInstance?.contract?.id}">${contractAuditInstance?.contract?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contractAuditInstance?.dateOfAcceptance}">
				<li class="fieldcontain">
					<span id="dateOfAcceptance-label" class="property-label"><g:message code="contractAudit.dateOfAcceptance.label" default="Date Of Acceptance" /></span>
					
						<span class="property-value" aria-labelledby="dateOfAcceptance-label"><g:formatDate date="${contractAuditInstance?.dateOfAcceptance}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${contractAuditInstance?.id}" />
					<g:link class="edit" action="edit" id="${contractAuditInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
