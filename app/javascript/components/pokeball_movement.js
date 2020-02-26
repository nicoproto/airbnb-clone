const pokeballMoves = function() {
  // Get all markers
  const markers = document.querySelectorAll(".marker");
  // Get random marker
  let marker_number = Math.round(Math.random() * (markers.length - 1));
  // Give transition to marker
  markers[marker_number].style.transition = "all 0.5s ease";
  // Get transform style
  let string = markers[marker_number].style.transform;
  // Split it into an array
  let array = string.split(")");

  const rotateBall = (rotation) => {
    // Create string with new transform value
    let new_string = array[0] + ") " + array[1] + ") " + `rotate(${rotation}deg)`;
    // Reassign marker transform
    markers[marker_number].style.transform = new_string;
  };

  rotateBall(30);
  setTimeout(function(){ rotateBall(-30);}, 200);
  setTimeout(function(){ rotateBall(0);}, 400);
  setTimeout(function(){ rotateBall(-30);}, 600);
  setTimeout(function(){ rotateBall(0);}, 800);
}

export { pokeballMoves }

