require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

// import "../plugins/flatpickr"
import { toggleDateInputs } from '../plugins/flatpickr';

import { previewImageOnFileSelect } from '../components/photo_preview';

import { pokeballMoves } from '../components/pokeball_movement';

initMapbox();
initAutocomplete();
previewImageOnFileSelect();


toggleDateInputs();




setInterval(function(){
  pokeballMoves();
}, 2000);
