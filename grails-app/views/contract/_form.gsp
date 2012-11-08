<%@ page import="br.com.almana.domain.Contract" %>



<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'text', 'error')} required">
    <label for="text">
        <g:message code="contract.text.label" default="Text" />
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="text" cols="40" rows="5" maxlength="10000" required="" value="${contractInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contractInstance, field: 'enabled', 'error')} ">
    <label for="enabled">
        <g:message code="contract.enabled.label" default="Enabled" />
    </label>
    <g:checkBox name="enabled" value="${contractInstance?.enabled}" />
</div>
