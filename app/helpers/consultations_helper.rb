# -*- encoding : utf-8 -*-
module ConsultationsHelper
  def add_consul_diag_link(name, f)
    new_object = f.object.class.reflect_on_association(:consul_diags).klass.new
    fields = f.fields_for('consul_diags', new_object, :child_index => "new_consul_diags") do |builder|
      render('consul_diag', :f => builder)
    end
    link_to_function(name, "add_fields(this, 'consul_diags', \"#{escape_javascript(fields)}\")")
  end
  def add_consul_trat_link(name, f)
    new_object = f.object.class.reflect_on_association(:consul_trats).klass.new
    fields = f.fields_for('consul_trats', new_object, :child_index => "new_consul_trats") do |builder|
      render('consul_trat', :f => builder)
    end
    link_to_function(name, "add_fields(this, 'consul_trats', \"#{escape_javascript(fields)}\")")
  end
  
end
