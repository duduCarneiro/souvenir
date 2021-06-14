
function initIalize() {
  const earthDiv = document.getElementById("earth_div")
  if (earthDiv) {
    var earth = new WE.map('earth_div');
    earth.setView([42.8011, 8.2266], 0.8);

      WE.tileLayer('https://webglearth.github.io/webglearth2-offline/{z}/{x}/{y}.jpg', {
      tileSize: 256,
      bounds: [[-850, -1800], [850, 1800]],
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
        earth.setCenter([c[0], c[1] + 0.1*(elapsed/40)]);
        requestAnimationFrame(animate);
    });

    // Markers
    // const markersall = document.getElementById("allmarkers");
    // const markersarray = markersall.dataset.markers;
    // // console.log(markersarray);

    // JSON.parse(markersarray).forEach((pin) => {
    // //   console.log(pin.idlocation);
    // //   WE.marker([pin.lat, pin.lng], pin.ppic, 50, 20).addTo(earth);
    //    WE.marker([pin.lat, pin.lng]).addTo(earth);

    // });
    // var markerCustom = WE.marker([500, -9], '/img/logo-webglearth-white-100.png', 100, 24).addTo(earth);


  }

}


export { initIalize };