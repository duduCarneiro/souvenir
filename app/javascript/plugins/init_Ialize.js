
function initIalize() {
    const earthDiv = document.getElementById("earth_div")
    if (earthDiv) {
      var earth = new WE.map('earth_div');
    earth.setView([46.8011, 8.2266], 2);
    WE.tileLayer('https://webglearth.github.io/webglearth2-offline/{z}/{x}/{y}.jpg', {
      tileSize: 256,
      bounds: [[-85, -180], [85, 180]],
      minZoom: 0,
      maxZoom: 16,
      attribution: 'WebGLEarth example',
      tms: true
    }).addTo(earth);

    // Markers
    const markersall = document.getElementById("allmarkers");
    const markersarray = markersall.dataset.markers;
    console.log(markersarray);

    JSON.parse(markersarray).forEach((pin) => {
        console.log(pin.idlocation);
        WE.marker([pin.lat, pin.lng], pin.ppic, 150, 50).addTo(earth);
      });


    console.log("done");
    var markerCustom = WE.marker([500, -9], '/img/logo-webglearth-white-100.png', 100, 24).addTo(earth);

    }
    
}
  

    export { initIalize };