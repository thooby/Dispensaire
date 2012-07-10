# -*- encoding : utf-8 -*-
module ApplicationHelper
  
  def init_jquery_ui
    content_for :head do
      stylesheet_link_tag('jquery-ui-1.8.21.custom.css') +
      javascript_include_tag('jquery-ui-1.8.21.custom.min')
    end  
  end
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "if (confirm(\"#{t('Seguro')}\")) remove_fields(this)", :title => 'Éliminer')
  end
  
end
