module ConsultationsHelper
  def add_consul_diag_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :consul_diags, :partial =>'consul_diag', :object => ConsulDiag.new
    end
  end
end
