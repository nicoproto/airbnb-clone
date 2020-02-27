const pokeballMoves = function() {
  // Get all markers
  const markers = document.querySelectorAll(".marker");
  // Get random marker
  let marker_number = Math.round(Math.random() * (markers.length - 1));
  // Give transition to marker
  markers[marker_number].style.transition = "all 0.5s ease";

  const rotateBall = (marker, rotation) => {
    // Give transition to marker
    marker.style.transition = "all 0.5s ease";
    // Get transform style
    let string = marker.style.transform;
    // Split it into an array
    let array = string.split(")");

    // Create string with new transform value
    let new_string = array[0] + ") " + array[1] + ") " + `rotate(${rotation}deg)`;
    // Reassign marker transform
    marker.style.transform = new_string;
  };

  rotateBall(markers[marker_number], 30);
  setTimeout(function(){ rotateBall(markers[marker_number], -30);}, 200);
  setTimeout(function(){ rotateBall(markers[marker_number], 0);}, 400);
  setTimeout(function(){ rotateBall(markers[marker_number], -30);}, 600);
  setTimeout(function(){ rotateBall(markers[marker_number], 0);}, 800);
}

const pokeHover = function () {

  const rotateBall = (marker, rotation) => {
    // Give transition to marker
    marker.style.transition = "all 0.5s ease";
    // Get transform style
    let string = marker.style.transform;
    // Split it into an array
    let array = string.split(")");

    // Create string with new transform value
    let new_string = array[0] + ") " + array[1] + ") " + `rotate(${rotation}deg)`;
    // Reassign marker transform
    marker.style.transform = new_string;
  };

  // Get all the cards
  const cards = document.querySelectorAll(".clash-card.barbarian");
  // Transform them into an array
  var cards_array = Array.prototype.slice.call(cards);

  // Get all the markers
  const markers = document.querySelectorAll(".marker");
  // Transform them into an array
  var markers_array = Array.prototype.slice.call(markers);

  cards.forEach((card) => {
    card.addEventListener("mouseover", function(event) {
      // Get the index of the event
      var pokemon_index = cards_array.indexOf(event.currentTarget);

      rotateBall(markers[pokemon_index], 30);
      setTimeout(function(){ rotateBall(markers[pokemon_index], -30);}, 200);
      setTimeout(function(){ rotateBall(markers[pokemon_index], 0);}, 400);
      setTimeout(function(){ rotateBall(markers[pokemon_index], -30);}, 600);
      setTimeout(function(){ rotateBall(markers[pokemon_index], 0);}, 800);
    });
  });
}

export { pokeballMoves, pokeHover }
