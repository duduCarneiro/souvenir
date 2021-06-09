
const initMarker = () => {
    const earth = new WE.map('earth_div');
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
    const before = null;
    requestAnimationFrame( const animate = (now) => {
        const c = earth.getPosition();
        const elapsed = before? now - before: 0;
        before = now;
        earth.setCenter([c[0], c[1] + 0.1*(elapsed/60)]);
        requestAnimationFrame(animate);
    });

    // Markers

    const marker = WE.marker([51.5, -0.09]).addTo(earth);
    const marker2 = WE.marker([30.058056, 31.228889], "https://res.cloudinary.com/dii4d3v8r/image/upload/v1623175479/zi4fmodnlxlsvdj63scrfdjuqyho.jpg", 100, 50).addTo(earth);
    const marker3 = WE.marker([37.058056, -2.228889], "https://res.cloudinary.com/dii4d3v8r/image/upload/v1623175486/oqbhpw6v4pkhfrkqjtqk1xkb753e.jpg", 100, 50).addTo(earth);
    const marker8 = WE.marker([30.058056, -4.228889], "https://res.cloudinary.com/dii4d3v8r/image/upload/v1623176294/to4wb6nhssera4wnkfl63pogvncx.jpg", 100, 50).addTo(earth);

    const markerCustom = WE.marker([500, -9], '/img/logo-webglearth-white-100.png', 100, 24).addTo(earth);
};

// fetch("http://www.webglearth.com/v2/api.js")
//   .then(response => response.json())
//   .then((data) => {

//   });



export { initMarker };