<!DOCTYPE html>
<html>
<head>
	<!-- based on ./Leaflet.Photo/examples/cartodb.html -->

	<title>Leaflet Geograph Demo</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<link href="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.3.4/leaflet.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.css" />	

	<link rel="stylesheet" href="Leaflet.Photo/Leaflet.Photo.css" />	

	<style>
		html, body, #map {
		        margin: 0; height: 100%; background: #fff;
		        max-width:1024px;
		        max-height:800px;
		}
	</style>

</head>
<body>
	<div id="map"></div>
	<div id="message" style="z-index:10000;position:fixed;top:0;left:120px;background-color:white;font-size:1em;font-family:sans-serif;opacity:0.8"></div>
	<script src="Leaflet.Photo/examples/lib/reqwest.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.3.4/leaflet-src.js"></script>

        <script src="https://unpkg.com/leaflet.markercluster@1.4.1/dist/leaflet.markercluster-src.js"></script>

	<script src="Leaflet.Photo/Leaflet.Photo.js"></script>	

	<script src="leaflet-maskcanvas/src/QuadTree.js"></script>
	<script src="leaflet-maskcanvas/src/L.GridLayer.MaskCanvas.js"></script>

	<script src="Leaflet.GeographPhotos.js"></script>

	<script src="Control.BingGeocoder.js"></script>

	<script>

        var center = new L.LatLng(54.55,-3.88);
        var map = L.map('map', {
                center: center,
                zoom: 5,
                minZoom: 1, maxZoom: 21
        });


	///////////////////////////////////////////////

	// create the basetile layer with correct attribution
	var osmUrl='https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
	var osmAttrib='Map data &copy; <a href="https://openstreetmap.org">OpenStreetMap</a> contributors';
	var osm = new L.TileLayer(osmUrl, {minZoom: 1, maxZoom: 21, attribution: osmAttrib});
	map.addLayer(osm);

	///////////////////////////////////////////////

	var gph = L.geographPhotos({apiKey:'geograph_demo', autoZoomOnAdd: true, searchQuery:'canal',showDotsLayer:true});
	gph.addTo(map);

	var bingGeocoder = new L.Control.BingGeocoder('AiimKwaAfT3-rph2GFiRWl6jRB2iF-vWUO1DkVsPDa5RO8JD-ycMiOqtRG7SbkR9');

	map.addControl(bingGeocoder);

	</script>
</body>
</html>
