
function initIalize() {
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

    // Start a simple rotation animation
    // var before = null;
    // requestAnimationFrame(function animate(now) {
    //     var c = earth.getPosition();
    //     var elapsed = before? now - before: 0;
    //     before = now;
    //     earth.setCenter([c[0], c[1] + 0.1*(elapsed/60)]);
    //     requestAnimationFrame(animate);
    // });

    // Markers
    const markersall = document.getElementById("allmarkers");
    const markersarray = markersall.dataset.markers;
    console.log(markersarray);

    // JSON.parse(markersarray).forEach((pin) => {
    //     console.log(pin.idlocation);
    //    // console.log(cloudinary.imagePath(pin.main_image));
    //     WE.marker([pin.lat, pin.lng], cloudinary.image('to4wb6nhssera4wnkfl63pogvncx', {secure: true, transformation: [
    //         {radius: 20},
    //         ]}).toHtml(), 100, 50).addTo(earth);
    //   });


    console.log("done");
    WE.marker([51.5, -0.09]).addTo(earth);
    WE.marker([30.058056, 31.228889], "https://res.cloudinary.com/dii4d3v8r/image/upload/v1623175479/zi4fmodnlxlsvdj63scrfdjuqyho.jpg", 100, 50).addTo(earth);

    var markerCustom = WE.marker([500, -9], '/img/logo-webglearth-white-100.png', 100, 24).addTo(earth);
}
  

    export { initIalize };