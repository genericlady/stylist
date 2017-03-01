module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="has-fail has-feedback">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def error_messages_for(attribute)
    return "" unless devise_error_messages?

    messages = resource.
      errors.
      full_messages_for(attribute).
      map { |msg| content_tag(:li, msg) }.
      join

    html = <<-HTML
    <ul class="list-unstyled error-messages">#{messages}</ul>
    HTML

    html.html_safe
  end

  def has_error(attribute)
    return "" unless devise_error_messages?

    if resource.errors.full_messages_for(attribute).empty?
      ""
    else
      "has-error has-feedback"
    end
  end

  def devise_error_messages?
    !resource.errors.empty?
  end
end
