import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('.address_search');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
