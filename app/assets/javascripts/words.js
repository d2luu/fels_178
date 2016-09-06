var checkbox_tick = function() {
  $('.chb').on('change', function(){
  $('.chb').not(this).prop('checked', false);
  });
};
$(document).ready(checkbox_tick);
$(document).on('page:load', checkbox_tick);

var add_answer = function(){$('.add_answer').click(function() {
    var association = $(this).attr('data-association');
    var target = $(this).attr('target');
    var regexp = new RegExp('new_' + association, 'g');
    var new_id = new Date().getTime();
    var Dest = (target == '') ? $(this).parent() : $('#'+target);
    Dest.append(window[association+'_fields'].replace(regexp, new_id));
    checkbox_tick();
    remove_link();
    return false;
  });
};

$(document).ready(add_answer);
$(document).on('page:load', add_answer);

var remove_link = function(){
  $('.remover_link').click(function(event){
    event.preventDefault();
    $(this).prev('input[type=hidden').val('1');
    $(this).closest('.removable').hide();
  });
};

$(document).ready(remove_link);
$(document).on('page:load', remove_link);
$(document).on('page:change', remove_link);
