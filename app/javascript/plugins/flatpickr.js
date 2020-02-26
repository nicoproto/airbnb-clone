import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

// if (document.getElementById('div_data')) {
//   const unvailableDates = JSON.parse(document.getElementById('div_data').dataset.unavailable);

//   flatpickr("#datepicker", {
//     minDate: "today",
//     disable: unvailableDates,
//     dateFormat: "Y-m-d",
//   });
// }


const toggleDateInputs = function() {
  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');

  if (endDateInput) { endDateInput.disabled = true; }

  if (startDateInput && endDateInput) {
    const unvailableDates = JSON.parse(document.getElementById('div_data').dataset.unavailable);

    console.log(unvailableDates);

    flatpickr(startDateInput, {
      minDate: 'today',
      dateFormat: 'Y-m-d',
      disable: unvailableDates,
      onChange: function(selectedDates, selectedDate) {
        console.log(selectedDate);
        console.log(selectedDates);
        // if (selectedDate === '') {
        //   console.log("im in");
        //   endDateInput.disabled = true;
        // }

        let minDate = selectedDates[0];
        minDate.setDate(minDate.getDate() + 1);
        endDateCalendar.set('minDate', minDate);
        endDateInput.disabled = false;
      }
    });
      const endDateCalendar = flatpickr(endDateInput, { dateFormat: 'Y-m-d', disable: unvailableDates});
  }
};

export { toggleDateInputs }
