<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <asset:link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
    <asset:stylesheet src="inventory.css"/>
    <asset:javascript src="jquery/jquery-1.11.2.min.js"/>
    <asset:javascript src="jquery/jquery-ui.min.js"/>
    <asset:javascript src="jquery/accorditionmenu.js"/>
    <g:layoutHead/>

</head>

<body role="document">

<div class="container">
    <g:render template="/partials/header"/>
    <div class="span-24">
        <g:layoutBody/>
    </div>

    <div class="span-24">
        <g:render template="/partials/footer"/>
    </div>

</div>
</body>
</html>