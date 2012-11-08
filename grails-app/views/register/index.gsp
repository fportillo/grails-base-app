<!doctype html>
<html>
    <head>
        <meta name='layout' content='main'/>
        <title><g:message code='spring.security.ui.register.title'/></title>
    </head>
    <body>
        <div id="register" class="content scaffold-create" role="main">
            <h1><g:message code="spring.security.ui.register.description" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${command}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${command}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">
                            data-field-id="${error.field}"</g:if>>
                            <g:message error="${error}"/>
                        </li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action='register' name='registerForm'>
                <fieldset class="form">

                    <g:if test='${emailSent}'>
                        <g:message code='spring.security.ui.register.sent'/>
                    </g:if>
                    <g:else>
                        <div class="fieldcontain ${hasErrors(bean: command, field: 'username', 'error')} ">
                            <label for="username">
                                <g:message code="user.username.label" default="Nome de Usuário" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:textField name="username" value="${command?.username}" />
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: command, field: 'email', 'error')} ">
                            <label for="email">
                                <g:message code="user.email.label" default="E-mail" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:textField name="email" value="${command?.email}" />
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: command, field: 'password', 'error')} ">
                            <label for="password">
                                <g:message code="user.password.label" default="Senha" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:passwordField name="password" value="${command?.password}" />
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: command, field: 'password2', 'error')} ">
                            <label for="password2">
                                <g:message code="user.password2.label" default="Senha (Novamente)" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:passwordField name="password2" value="${command?.password2}" />
                        </div>

                        <div class="fieldcontain">
                            <div width:"600px;">
                                ${command?.contract?.text?.decodeHTML()}
                            </div>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: command, field: 'contractAccepted', 'error')} ">
                            <label for="contractAccepted">
                                <g:message code="accepts.contract" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:checkBox name="contractAccepted" value="${command?.contractAccepted}" />
                        </div>

                    </g:else>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton 
                        name="create" 
                        class="save" 
                        value="${message(code: 'spring.security.ui.register.submit', default: 'Enviar')}" />
                </fieldset>
            </g:form>
        </div>

        <script>
        $(document).ready(function() {
            $('#username').focus();
        });
        </script>

    </body>
</html>
