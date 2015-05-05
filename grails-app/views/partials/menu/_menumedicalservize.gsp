<div class="span-24 ui-widget-header ui-corner-all topmenu">
    <div class="ui-widget">
        <ul class="ui-menu ui-helper-reset ui-helper-clearfix">
            <li class="ui-state-default ui-corner-top">
                <g:link uri="/"><g:message code="gbuz.home.label"/></g:link></li>
            <li class="ui-state-default ui-corner-top">
                <a href="${createLink(controller: 'about', action: 'last')}"><g:message
                        code="gbuz.about.label"/></a></li>
            <li class="ui-state-default ui-corner-top">
                <a href="${createLink(controller: 'structureLPU', action: 'index')}"><g:message
                        code="gbuz.structure.label"/></a></li>
            <li class="ui-state-default ui-corner-top">
                <a href="${createLink(controller: 'patientInformation', action: 'public_list')}"><g:message
                        code="gbuz.patientInformation.label"/></a></li>
            <li class="ui-state-default ui-corner-top ui-state-active">
                <a href="${createLink(controller: 'medicalServize', action: 'public_list')}"><g:message
                        code="gbuz.serviceCommerce.label"/></a></li>
            <li class="ui-state-default ui-corner-top">
                <a href="${createLink(controller: 'information', action: 'public_list')}"><g:message
                        code="gbuz.information.label"/></a></li>
            <li class="ui-state-default ui-corner-top">
                <a href="${createLink(controller: 'licenseLPU', action: 'public_list')}"><g:message
                        code="gbuz.license.label"/></a></li>
            <sec:ifAllGranted roles="ROLE_ADMIN,ROLE_SUPERVISOR">
                <li class="ui-state-default ui-corner-top">
                    <a href="${createLink(controller: 'administration', action: 'index')}"><g:message
                            code="admin.home"/></a></li>
            </sec:ifAllGranted>
        </ul>
    </div>
</div>