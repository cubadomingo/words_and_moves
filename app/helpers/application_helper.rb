module ApplicationHelper
  def resource_name
    :session
  end

  def

  def resource
    @resource ||= Session.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:session]
  end

  def delete_button_to(title, url, options = {})
    form_options = {
      method: "delete"
    }.merge(options.delete(:options) || {})
    button_options = {
      type: 'submit'
    }.merge(options[:button] || {})

    form_tag(url, form_options) do
      button_tag(button_options) do
        title.html_safe
      end
    end
  end
end
