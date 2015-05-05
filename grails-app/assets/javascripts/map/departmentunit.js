var pathname = "departmentUnit/addToMap";
var url_request = location.protocol + "//" + location.host + "/" + pathname;

var request_showlpu = OpenLayers.Request.POST({
    url: url_request,
    callback: showlpu
});

function showlpu(request_showlpu) {
    OpenLayers.Lang.setCode("ru");
    var proj = new OpenLayers.Projection("EPSG:4326");
    var projosm = new OpenLayers.Projection("EPSG:900913");

    var response = request_showlpu.responseText;

    var jsonObj = jsonParse(response);

    var resp = {
        x: jsonObj.longitude,
        y: jsonObj.latitude,
        title: jsonObj.title
        //lpu_marker: jsonObj.marker
    };

    var pureCoverage = false;
    // pink tile avoidance
    OpenLayers.IMAGE_RELOAD_ATTEMPTS = 5;
    // make OL compute scale according to WMS spec
    OpenLayers.DOTS_PER_INCH = 25.4 / 0.28;
    //FORMAT_OPTIONS=antialias:none;

    /**
     * if this is just a coverage or a group of them,
     * disable a few items,
     * and default to jpeg format
     */

    format = 'image/png';
    FORMAT_OPTIONS = {

    }

    var bounds = new OpenLayers.Bounds(
        42.909, 34.196,
        62.143, 129.822
    );

    var options = {
        controls: [],
        maxExtent: bounds,
        maxResolution: 0.010986328125,//0.3735390625,//0.17578125,//0.0054931640625,//0.0010546875,
        numZoomLevels: 19,
        projection: new OpenLayers.Projection("EPSG:900913"),
        displayProjection: new OpenLayers.Projection("EPSG:4326"),
        //attribution:'<a href="http://localhost:8080/geoserver/">Астрахань ГИС</a>',
        attribution: '<a href="https://privolgie.ru">ГБУЗ АО Приволжская РБ</a>',
        units: 'degrees'
    };

    var map = new OpenLayers.Map('map', options);

    var osm = new OpenLayers.Layer.OSM(' Слой OpenStreetMap');

    // --------------------------------------------------------------------------------------------- //

    var graticule = new OpenLayers.Control.Graticule({
        autoActivate: true,
        labelled: false,
        displayInLayerSwitcher: true,
        numPoints: 2,
        layerName: " Координатная сетка",
        labelFormat: 'dms'
    });

    // --------------------------------------------------------------------------------------------- //

    /**
     * Отображение на карте местонахождения компании
     */

    var lonlat = new OpenLayers.LonLat(resp.x, resp.y);

    var lpu = new OpenLayers.Layer.Markers(" " + resp.title);

    var size = new OpenLayers.Size(24, 24);

    var offset = new OpenLayers.Pixel(-(size.w / 2), -(size.h / 2));

    var icon = new OpenLayers.Icon('../../images/hospital_1.png', size, offset);

    var lpu_l = lpu.addMarker(new OpenLayers.Marker(lonlat, icon));

    /**
     *  Конец блока
     */

    var lpu_layer = new OpenLayers.Layer.Vector(" " + resp.title, {
        layer: lpu
    })


    layers = [osm, lpu]
    map.addLayers(layers);
    map.setCenter(lonlat.transform(proj, map.getProjectionObject()));
//    map.addControl(new OpenLayers.Control.PanZoom());
    map.zoomTo(10);
//    map.addControl(new OpenLayers.Control.ScaleLine())
    map.addControl(new OpenLayers.Control.KeyboardDefaults());
    map.addControl(new OpenLayers.Control.Navigation());
//    map.addControl(new OpenLayers.Control.OverviewMap());
    map.addControl(new OpenLayers.Control.MousePosition());
//    map.addControl(new OpenLayers.Control.LayerSwitcher());

};
