module PublicHelper
  def back_link(params, name: "Back", className: "btn btn-primary")
    if params[:category_slug].present?
      link_to name, root_path, class: className 
    end
  end
end
