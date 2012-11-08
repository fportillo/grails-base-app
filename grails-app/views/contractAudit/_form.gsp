<%@ page import="br.com.almana.domain.ContractAudit" %>



<div class="fieldcontain ${hasErrors(bean: contractAuditInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="contractAudit.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${br.com.almana.domain.User.list()}" optionKey="id" required="" value="${contractAuditInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractAuditInstance, field: 'contract', 'error')} required">
	<label for="contract">
		<g:message code="contractAudit.contract.label" default="Contract" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="contract" name="contract.id" from="${br.com.almana.domain.Contract.list()}" optionKey="id" required="" value="${contractAuditInstance?.contract?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractAuditInstance, field: 'dateOfAcceptance', 'error')} required">
	<label for="dateOfAcceptance">
		<g:message code="contractAudit.dateOfAcceptance.label" default="Date Of Acceptance" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfAcceptance" precision="day"  value="${contractAuditInstance?.dateOfAcceptance}"  />
</div>

