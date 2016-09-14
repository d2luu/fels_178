var countdown = function() {
  $('#clock').countdown({
    until: $('#remaining_time').val(),
    format: 'MS',
    onExpiry: function() {
      $('.submit-time-out').trigger('click');
      $('.submit-time-out').hidden();
    }
  });
}

document.addEventListener('turbolinks:load', countdown);
$(document).on('page:update', countdown);
