// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

#function add_fields(link, association, content) {
#  var new_id = new Date().getTime();
#  var regexp = new RegExp("new_" + association, "g")
#  $(link).up().insert({
#    before: content.replace(regexp, new_id)
#  });
#}
jQuery(function($) {
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

})
