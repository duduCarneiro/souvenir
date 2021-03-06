import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 50, maxZoom: 11, duration: 1000 });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '80px';
    element.style.height = '40px';

    const markelement = new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
      markelement.getElement().addEventListener('click', () => {
        window.location = marker.redirect_to;
      });


  });
};




const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/dumania/ckpfriohw0lcy18k1us8tt3tk'
      // style: 'mapbox://styles/mapbox/streets-v10'
    });

    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl }));


    const markers = JSON.parse(mapElement.dataset.markers);

    // markers.forEach((marker) => {
    //   new mapboxgl.Marker()
    //     .setLngLat([ marker.lng, marker.lat ])
    //     .addTo(map);
    // });
    ////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);

    mapElement.scrollIntoView({
      behavior: 'smooth'
    });


  }
};

export { initMapbox };




