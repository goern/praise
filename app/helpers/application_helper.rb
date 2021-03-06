module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-block"
    else "alert #{level}"
    end
  end
  
  def image_url(source)
    URI.join(root_url, image_path(source))
  end
end
