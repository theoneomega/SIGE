module ApplicationHelper
  def devise_mapping
    Devise.mappings[:user]
  end
  def resource_name
    devise_mapping.name
  end

  def resource_class
    devise_mapping.to
  end

  def algo
    if signed_in?

    end
  end
  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end





