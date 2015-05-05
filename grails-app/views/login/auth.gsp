<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name='layout' content='main'/>
    <title><g:message code="admin.authorize"/></title>
</head>

<body>
<div class="span-24">
    <g:render template="/partials/menu/menumain"/>
    <div class="span-6">
        <g:render template="/partials/sideleft"/>
    </div>

    <fieldset class="ui-corner-all">
        <legend>
            <g:message code="admin.authorize.please"/>
        </legend>
        <g:if test='${flash.message}'>
            <div class='message'>
                ${flash.message}
            </div>
        </g:if>
         

        <form action='${postUrl}' method='POST' id='loginForm'
              class='cssform'>
            <table>
                <tbody>
                <tr class="prop">
                    <td valign="top" class="name"><label for='j_username'><g:message
                            code="person.username"/></label></td>
                    <td valign="top" class="value"><input type='text'
                                                          class='text_' name='j_username' id='j_username'
                                                          value='${request.remoteUser}'/></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name"><label for='j_password'><g:message
                            code="person.passwd"/></label></td>
                    <td valign="top" class="value"><input type='password'
                                                          class='text_' name='j_password' id='j_password'/></td>
                </tr>
                <tr class="prop">
                    <td valign="top" class="name"><label for='remember_me'><g:message
                            code="person.remmemberme"/></label></td>
                    <td valign="top" class="value"><input type='checkbox'
                                                          class='chk' name='_spring_security_remember_me'
                                                          id='remember_me'
                                                          <g:if test='${hasCookie}'>checked='checked'</g:if>/></td>
                </tr>
                </tbody>
            </table>

            <div class="buttons">
                <span class="button"><input class="save" type="submit"
                                            value="<g:message code="default.button.login.label"/>"/></span>
            </div>
        </form>
    </fieldset>

    <script type='text/javascript'>
        <!--
        (function () {
            document.forms['loginForm'].elements['j_username'].focus();
        })();
        // -->
    </script>
</body>