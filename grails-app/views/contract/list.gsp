<%@ page import="br.com.almana.domain.Contract" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
  </head>
  <body>
    <a href="#list-contract" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
      <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
      </ul>
    </div>
    <div id="list-contract" class="content scaffold-list" role="main">
      <h1><g:message code="default.list.label" args="[entityName]" /></h1>
      <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table>
        <thead>
          <tr>

            <g:sortableColumn property="text" title="${message(code: 'contract.id.label', default: 'id')}" />
            <g:sortableColumn property="creationDate" title="${message(code: 'contract.creationDate.label', default: 'Creation Date')}" />
            <g:sortableColumn property="enabled" title="${message(code: 'contract.enabled.label', default: 'Enabled')}" />

          </tr>
        </thead>
        <tbody>
        <g:each in="${contractInstanceList}" status="i" var="contractInstance">
          <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
            <td>
                <g:link action="show" id="${contractInstance.id}">
                    ${fieldValue(bean: contractInstance, field: "id")}
                </g:link>
            </td>

            <td>
                <g:link action="show" id="${contractInstance.id}">
                    <g:formatDate date="${contractInstance.creationDate}" />
                </g:link>
            </td>

            <td>
                <g:link action="show" id="${contractInstance.id}">
                    <g:formatBoolean boolean="${contractInstance.enabled}" />
                </g:link>
            </td>
          </tr>
        </g:each>
        </tbody>
      </table>
      <div class="pagination">
        <g:paginate total="${contractInstanceTotal}" />
      </div>
    </div>
  </body>
</html>
