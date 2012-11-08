<!doctype html>
<html>
    <head>
        <title><g:message code='spring.security.ui.login.title'/></title>
        <meta name='layout' content='main'/>
    </head>
<body>

<div id="login" class="content scaffold-create" role="main">
    <h1>
        <g:message code='spring.security.ui.login.signin'/>
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <form action='${postUrl}' method='POST' id="loginForm" name="loginForm" autocomplete='off'>

        <fieldset class="form">
            <div class="fieldcontain">
                <label for="username" style="width: 40%;">
                    <g:message code='spring.security.ui.login.username'/>
                </label>
                <input name="j_username" id="username" size="20" />
            </div>

            <div class="fieldcontain">
                <label for="password" style="width: 40%;">
                    <g:message code='spring.security.ui.login.password'/>
                </label>
                <input type="password" name="j_password" id="password" size="20" />
            </div>

            <div class="fieldcontain">
                <label for='remember_me' style="width: 40%;" >
                    <g:message code='spring.security.ui.login.rememberme'/>
                </label>
                <input type="checkbox" class="checkbox" name="${rememberMeParameter}" id="remember_me" checked="checked" />
                <span class="forgot-link">
                    <g:link controller='register' action='forgotPassword'>
                        <g:message code='spring.security.ui.login.forgotPassword'/>
                    </g:link>
                </span>
            </div>
        </fieldset>
        <fieldset class="buttons" style="text-align: center;">
            <g:link id='register' controller='register'><g:message code='spring.security.ui.login.register'/></g:link>
            <g:submitButton name='loginButton' value="${message(code: 'spring.security.ui.login.login')}"/>
        </fieldset>
    </form>
</div>

<script>
$(document).ready(function() {
    $('#username').focus();
});

<s2ui:initCheckboxes/>

</script>

</body>
</html>
