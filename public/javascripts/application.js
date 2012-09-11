// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// #function add_fields(link, association, content) {
// #  var new_id = new Date().getTime();
// #  var regexp = new RegExp("new_" + association, "g")
// #  $(link).up().insert({
// #    before: content.replace(regexp, new_id)
// #  });
// #}

$(document).ready(function() {
  // when the #country field changes
  $("#patient_commune_id").change(function() {
    // make a POST call and replace the content
    var commune = $('select#patient_commune_id :selected').val();
    if(commune == "") commune="0";
    jQuery.get('/patients/update_village_select/' + commune, function(data){
        $("#addressVillages").html(data);
    })
    return false;
  });
  
  setAutoCompleters();
})

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest("div").hide();
}

function add_fields(link, association, content, autocomplete) {
  autocomplete = autocomplete || false
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parents(".fields").find('div:last').after(content.replace(regexp, new_id));
  if (autocomplete == true) {
    setAutoCompleters();
  }
  // $(this).parents(".fields").find('div').attr("id", 'tr_' + new_id);
}

function setAutoCompleters() {
  $('input.autocomplete').each(function(){
    var spinner = $(this).siblings('span.spinner');
    var url = new String();                 
    var params = new String();                     
    if ($(this).attr('id').match(/consultation_consul_diags*/)) {
      url = "/diagnostics.json";    
      params = '&diag_type_id=';
    } else if ($(this).attr('id').match(/consultation_consul_trats*/)) {  
      url = "/traitements.json";            
      params = '&groupe_traitement_id=';
    } else if ($(this).attr('id').match(/consultation_consul_motifs*/)) {  
      url = "/motifs.json"; 
      params = '&groupe_traitement_id=';

    }
    
    $(this).autocomplete({
      source: function (request, response) {       
        var param_value = this.element.siblings('select').val();
        $.ajax({
          url: url + '?q=' + request.term + params + param_value,
          dataType: "json",
      	  success: function( data ) {
            response($.map(data, function(item){
      	    return { 
      	      value: item[0],
      	      label: item[1] 
            }
          spinner.hide();
      	  }));
      	}	
      });
      },
      search: function() {
        spinner.show();
      },
      focus: function( event, ui ) {
       $(this).attr('value', ui.item.label );
      	 return false;
      },
      select: function(event, ui) {
        spinner.hide();
        $(this).attr('value', ui.item.label);
        $(this).siblings('input[type=hidden]:first').attr('value', ui.item.value);
        return false;
      },
      close: function(event, ui){
        spinner.hide();
      }
  });
  })
}
