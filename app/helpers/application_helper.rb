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
    
  def link_to_add_fields(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
    end
  end
  
  def format_phone(phone, mobile=false)
    return phone if format.blank?
    groupings = format.scan(/d+/).map { |g| g.length }
    groupings = [3, 3, 4] unless groupings.length == 3
    ActionController::Base.helpers.number_to_phone(
      phone,
      :area_code => format.index('(') ? true : false,
      :groupings => groupings,
      :delimiter => format.reverse.match(/[^d]/).to_s
    )
  end
  
  

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end



