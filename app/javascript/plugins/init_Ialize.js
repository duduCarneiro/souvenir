
function initIalize() {
  const earthDiv = document.getElementById("earth_div")
  if (earthDiv) {
    var earth = new WE.map('earth_div');
    earth.setView([30.8011, 2.2266], 1.02);
      WE.tileLayer('https://webglearth.github.io/webglearth2-offline/{z}/{x}/{y}.jpg', {
      tileSize: 256,
      bounds: [[-85, -180], [85, 180]],
      minZoom: 0,
      maxZoom: 16,
      tms: true
    }).addTo(earth);

    // Start a simple rotation animation
    var before = null;
    requestAnimationFrame(function animate(now) {
        var c = earth.getPosition();
        var elapsed = before? now - before: 0;
        before = now;
        earth.setCenter([c[0], c[1] + 0.1*(elapsed/10)]);
        requestAnimationFrame(animate);
    });

    // Markers
    const markersall = document.getElementById("allmarkers");
    const markersarray = markersall.dataset.markers;
    console.log(markersarray);

    JSON.parse(markersarray).forEach((pin) => {
      console.log(pin.idlocation);
      WE.marker([pin.lat, pin.lng], pin.ppic, 50, 20).addTo(earth);
    });


    console.log("done");
    var markerCustom = WE.marker([500, -9], '/img/logo-webglearth-white-100.png', 100, 24).addTo(earth);

  }

}


export { initIalize };