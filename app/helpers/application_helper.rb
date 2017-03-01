module ApplicationHelper
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def has_error(resource, attribute)
    "has-error has-feedback" if resource.errors.messages.key?(attribute)
  end

end
