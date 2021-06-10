import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';


const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 50, maxZoom: 11, duration: 1000 });
};

const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window); // add this

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '50px';
      element.style.height = '50px';

  
      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add this
        .addTo(map);
    });
  };

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);


  }
};

export { initMapbox };





<h3>Locations from database</h3>
<ul>
  <% @locations.each do |element| %>
    <li><%= element.address %></li>
    <% @selectedmarkers = @markers.select {|x| x[:idlocation] == element.id } %>
    <% @selectedmarkers.each do |subelement| %>
      <% subelement[:ppic] = cl_image_path(subelement[:kpic]) %>
    <% end %>
    <%element.albums.each do |subpelement|%>
      <li><%=cl_image_tag((subpelement.photos.first.key),
        width: 150, height: 110, crop: :fill)%> </li>
    <% end %>
  <% end %>

  <div id='allmarkers' data-markers=<%=@markers.to_json%>></div>
</ul>