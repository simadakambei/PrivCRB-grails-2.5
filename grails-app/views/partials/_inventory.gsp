<fieldset class="ui-corner-all">
<legend class="inventory">
    <g:message code="desktop.inventory"/>
</legend>
<br/>
<!-- В сборе -->
<div class="span-8">
    <div class="ui-widget-header ui-corner-top center">
        <g:message code="desktop.inventory.computers.header"/>
    </div>

    <div class="ui-widget-content ui-corner-bottom">
        <div class="buttons button_in_div">
            <g:link controller="ARM" action="list" class="arm" target="_blank">
                <g:message code="desktop.inventory.arms"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="server" action="list" class="server" target="_blank">
                <g:message code="desktop.inventory.servers"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'think client']"
                    class="think_client" target="_blank">
                <g:message code="desktop.inventory.terminals"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'smartphone']" class="smartphone"
                    target="_blank">
                <g:message code="desktop.inventory.smartphones"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'planshet']" class="planshet"
                    target="_blank">
                <g:message code="desktop.inventory.planshets"/>
            </g:link>
        </div>

        <div class="buttons button_in_div_last">
            <g:link controller="externalAccessory" action="list" params="['device': 'notebook']" class="notebook"
                    target="_blank">
                <g:message code="desktop.inventory.notebooks"/>
            </g:link>
        </div>
    </div>
    <br/>
    <!-- Оргтехника -->
    <div class="ui-widget-header ui-corner-top center">
        <g:message code="desktop.inventory.orgtehnics.header"/>
    </div>

    <div class="ui-widget-content ui-corner-bottom">
        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'scanner']" class="scanner"
                    target="_blank">
                <g:message code="desktop.inventory.scanners"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'printer']" class="printer"
                    target="_blank">
                <g:message code="desktop.inventory.printers"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'mfu']" class="mfu" target="_blank">
                <g:message code="desktop.inventory.mfus"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'fax']" class="fax" target="_blank">
                <g:message code="desktop.inventory.faxies"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'barcode']" class="barcode_scanner"
                    target="_blank">
                <g:message code="desktop.inventory.barcode.scanners"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'cardreader']" class="card_reader"
                    target="_blank">
                <g:message code="desktop.inventory.card.readers"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'proector']" class="proector"
                    target="_blank">
                <g:message code="desktop.inventory.proectors"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'screen']" class="screen"
                    target="_blank">
                <g:message code="desktop.inventory.screens"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'holder']" class="holder"
                    target="_blank">
                <g:message code="desktop.inventory.holders"/>
            </g:link>
        </div>

        <div class="buttons button_in_div_last">
            <g:link controller="externalAccessory" action="list" params="['device': 'soundmixer']" class="sound_mixer"
                    target="_blank">
                <g:message code="desktop.inventory.soundmixers"/>
            </g:link>
        </div>
    </div>
    <br/>
    <!-- Сетевое оборудование -->
    <div class="ui-widget-header ui-corner-top center">
        <g:message code="desktop.inventory.networks.header"/>
    </div>

    <div class="ui-widget-content ui-corner-bottom">
        <div class="buttons button_in_div_last">
            <g:link controller="externalAccessory" action="list" params="['device': 'router']" class="routes"
                    target="_blank">
                <g:message code="desktop.inventory.routers"/>
            </g:link>
        </div>
    </div>
</div>
<!-- Комплектующие для компьютеров -->
<div class="span-8">
    <div class="ui-widget-header ui-corner-top center">
        <g:message code="desktop.inventory.accessories.header"/>
    </div>

    <div class="ui-widget-content ui-corner-bottom">
        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'monitor']" class="monitor"
                    target="_blank">
                <g:message code="desktop.inventory.monitors"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="systemUnit" action="list" class="system_unit">
                <g:message code="desktop.inventory.systemunits"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="computerAccessory" action="list" params="['device': 'motherboard']" class="motherboard"
                    target="_blank">
                <g:message code="desktop.inventory.motherboards"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="computerAccessory" action="list" params="['device': 'harddrive']" class="hard_drive"
                    target="_blank">
                <g:message code="desktop.inventory.harddrives"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="computerAccessory" action="list" params="['device': 'memory']" class="memory"
                    target="_blank">
                <g:message code="desktop.inventory.memories"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="computerAccessory" action="list" params="['device': 'cpu']" class="processor"
                    target="_blank">
                <g:message code="desktop.inventory.cpus"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="computerAccessory" action="list" params="['device': 'videocard']" class="video_card"
                    target="_blank">
                <g:message code="desktop.inventory.videocards"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="computerAccessory" action="list" params="['device': 'ethernetcard']"
                    class="ethernet_card" target="_blank">
                <g:message code="desktop.inventory.ethernetcards"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="computerAccessory" action="list" params="['device': 'audiocard']" class="audio_card"
                    target="_blank">
                <g:message code="desktop.inventory.audiocards"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="computerAccessory" action="list" params="['device': 'corpus']" class="corpus"
                    target="_blank">
                <g:message code="desktop.inventory.corpuses"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="computerAccessory" action="list" params="['device': 'powersupply']" class="power_supply"
                    target="_blank">
                <g:message code="desktop.inventory.powersupplies"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="computerAccessory" action="list" params="['device': 'cooler']" class="cooler"
                    target="_blank">
                <g:message code="desktop.inventory.coolers"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'keyboard']" class="keyboard"
                    target="_blank">
                <g:message code="desktop.inventory.keyboards"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'mouse']" class="mouse"
                    target="_blank">
                <g:message code="desktop.inventory.mouces"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="computerAccessory" action="list" params="['device': 'opticaldrive']"
                    class="optical_drive" target="_blank">
                <g:message code="desktop.inventory.opticaldrives"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="computerAccessory" action="list" params="['device': 'floppydrive']" class="floppy_drive"
                    target="_blank">
                <g:message code="desktop.inventory.floppydrives"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'externaldrive']"
                    class="external_drive" target="_blank">
                <g:message code="desktop.inventory.externaldrives"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'speaker']" class="speaker"
                    target="_blank">
                <g:message code="desktop.inventory.speakers"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'microphone']" class="microphone"
                    target="_blank">
                <g:message code="desktop.inventory.microphones"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'webcamera']" class="web_camera"
                    target="_blank">
                <g:message code="desktop.inventory.webcamers"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'ups']" class="ups" target="_blank">
                <g:message code="desktop.inventory.ups"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'usbhub']" class="usb_hub"
                    target="_blank">
                <g:message code="desktop.inventory.usbhubs"/>
            </g:link>
        </div>

        <div class="buttons button_in_div">
            <g:link controller="externalAccessory" action="list" params="['device': 'pilot']" class="pilot"
                    target="_blank">
                <g:message code="desktop.inventory.pilots"/>
            </g:link>
        </div>

        <div class="buttons button_in_div_last">
            <g:link controller="externalAccessory" action="list" params="['device': 'kvmswitch']" class="kvm_switch"
                    target="_blank">
                <g:message code="desktop.inventory.kvmswitch"/>
            </g:link>
        </div>
    </div>
    <br/>
    <!-- Расходные материалы -->
    <div class="ui-widget-header ui-corner-top center">
        <g:message code="desktop.inventory.expendable.materials.header"/>
    </div>

    <div class="ui-widget-content ui-corner-bottom">
        <div class="buttons button_in_div"></div>
    </div>
    <br/>
    <!-- Отчёты по данной тематике -->
    <div class="ui-widget-header ui-corner-top center">
        <g:message code="desktop.inventory.reports.header"/>
    </div>

    <div class="ui-widget-content ui-corner-bottom">
        <div class="buttons button_in_div_last">
            <g:link controller="report" action="list" class="reports">
                <g:message code="desktop.inventory.reports.header"/>
            </g:link>
        </div>
    </div>
</div>

</fieldset>