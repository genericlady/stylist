class ServiceCardPresenter < BasePresenter
  presents :service
  delegate :description, :price, :name, to: :service

  def print_description
    %Q(<p>#{description}</p>).html_safe
  end

  def print_price
    %Q(<p>#{price}</p>).html_safe
  end

  def print_rating
    %Q(
        <span class="icon icon-star"></span>
        <span class="icon icon-star"></span>
        <span class="icon icon-star"></span>
        <span class="icon icon-star"></span>
        <span class="icon icon-star"></span>
      ).html_safe
  end

  def print_name
    %Q(<h3 id="thumbnail-label">#{name}</h3>).html_safe
  end

  def print_total_votes
    %Q(<p>Total Votes: 498</p>).html_safe
  end

  def buttons
    if owner?
      %Q(<p>#{service_details_button + button_to_edit + button_to_delete}</p>).
        html_safe
    else
      %Q(<p>#{service_details_button}</p>).html_safe
    end
  end

  def link_to_reviews
  end

  private
  def service_details_button
    class_styles = "btn btn-primary card_button mr-1"
    options = { class: class_styles, role: "button" }
    path = user_service_path(current_user, service)

    link_to('Details', path, options)
  end

  def button_to_edit
    class_styles = "btn btn-warning card_button mr-1"
    options = { class: class_styles, role: "button" }
    path = edit_user_service_path(current_user, service)

    link_to('Edit', path, options)
  end

  def button_to_delete
    class_styles = "btn btn-danger card_button mr-1"
    options = { class: class_styles, role: "button", method: "delete" }
    path = user_service_path(current_user, service)

    link_to "Delete", path, options
  end

  def owner?
    current_user.id == service.user_id
  end
end
