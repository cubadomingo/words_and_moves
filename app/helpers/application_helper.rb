module ApplicationHelper
  def resource_name
    :session
  end

  def resource
    @resource ||= Session.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:session]
  end

end
