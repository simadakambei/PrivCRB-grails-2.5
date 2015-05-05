var pathname = "structureLPU/AddToMap";
var url_request = location.protocol + "//" + location.host + "/" + pathname;

var request_showall = OpenLayers.Request.POST({
    url: url_request,
    callback: showall
});

function showall(request_showall) {

    OpenLayers.Lang.setCode("ru");
    var proj = new OpenLayers.Projection("EPSG:4326");
    var projosm = new OpenLayers.Projection("EPSG:900913");

    var response = request_showall.responseText;

    var jsonObj = jsonParse(response);

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
        maxResolution: 0.010986328125, //0.3735390625,//0.17578125,//0.0054931640625,//0.0010546875,
        numZoomLevels: 19,
        projection: new OpenLayers.Projection("EPSG:900913"),
        displayProjection: new OpenLayers.Projection("EPSG:4326"),
        //attribution:'<a href="http://localhost:8080/geoserver/">Астрахань ГИС</a>',
        attribution: '<a href="https://privolgie.ru">ГБУЗ АО Приволжская ЦРБ</a>',
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
     * Отображение на карте местонахождения больницы
     */

    var lon, lat, title, point;

    var points = new Array();

    for (var i in jsonObj) {
        if (!jsonObj.hasOwnProperty(i)) continue;
        lon = jsonObj[i][0];
        lat = jsonObj[i][1];
        point = new OpenLayers.Geometry.Point(lon, lat);
        points.push(point);
    }
    ;
    //console.log(points);
    var gbuz = new OpenLayers.Geometry.MultiPoint(points);
    var gbuzFeature = new OpenLayers.Feature.Vector(gbuz);
    //console.log(gbuzFeature);
    var styleGbuz = new OpenLayers.Style({
        pointRadius: "9",
        fillColor: "#ffcc66",
        strokeColor: "#2191c0",
        strokeWidth: 2,
        externalGraphic: '../../images/hospital_1.png'
    });

    var lpu = new OpenLayers.Layer.Vector(" ЛПУ", {
        style: styleGbuz,
        projection: proj
    });

    lpu.addFeatures([gbuzFeature]);

    var lonlat_center = new OpenLayers.LonLat(47.997314, 46.317103);
    //console.log(lpu);
    var layers = [osm, lpu];
    map.addLayers(layers);
    map.setCenter(lonlat_center.transform(proj, map.getProjectionObject()));
//    map.addControl(new OpenLayers.Control.PanZoom());
    map.zoomTo(9);
//    map.addControl(new OpenLayers.Control.ScaleLine())
    map.addControl(new OpenLayers.Control.KeyboardDefaults());
    map.addControl(new OpenLayers.Control.Navigation());
//    map.addControl(new OpenLayers.Control.OverviewMap());
    map.addControl(new OpenLayers.Control.MousePosition());
//    map.addControl(new OpenLayers.Control.LayerSwitcher());

}
;
