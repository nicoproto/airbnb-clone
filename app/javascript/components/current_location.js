import mapboxgl from 'mapbox-gl';

const currentLocation = () => {

  // Get the button you want to trigger the find by location
  const onSelect = document.querySelector('.ap-input-icon.ap-icon-pin');
  // Get the submit button
  const submit_btn = document.getElementById("location-btn");

  // Check if location icon exists
  if (onSelect) {
    onSelect.addEventListener('click', (event) => {
      event.preventDefault();
      // Add options an error needed for the getCurrentPosition method
      var options = { enableHighAccuracy: true, timeout: 5000, maximumAge: 0};
      function error(err) { console.warn(`ERROR(${err.code}): ${err.message}`);}

      function success(pos) {
        // Get coords from the location response
        var crd = pos.coords;
        // Find hidden tag
        const currentLocation = document.getElementById('current_location');
        // Change the value of the hidden tag for the location value
        currentLocation.value = [crd.latitude, crd.longitude];
        // Click the submit button
        submit_btn.click();
      }

      navigator.geolocation.getCurrentPosition(success, error, options);
    });
  }
}

export { currentLocation }
