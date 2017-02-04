class UserPresenter < BasePresenter
  presents :user
  delegate :full_name, to: :user

  def cover_photo
    # "background-image: url(http://placehold.it/1086x448); "
    %Q(background-color: purple;)
  end

  def avatar
    %Q(<img src="#{default_avatar_path}" class="rounded-circle media-object">).
      html_safe
  end

  def default_avatar_path
    "../assets/#{avatar_name}"
  end

  def card_profile_image
    %Q(<img class="card-profile-img" src="#{default_avatar_path}">).html_safe
  end

  def print_name
    %Q(<h3 class="profile-header-user">#{full_name}</h3>).html_safe
  end

  def bio(class_name: nil)
    bio_text = <<-BIO
      I wish i was a little bit taller, 
      wish i was a baller, wish i had a girl… also.
    BIO

    if class_name.nil?
      %Q(<p>#{bio_text}</p>).html_safe
    else
      %Q(<p class="#{class_name}">#{bio_text}</p>).html_safe
    end
  end

  def link_to_show
    %Q(<a class="text-inherit" href="/">#{full_name}</a>).html_safe
  end

  def photo_thumbnails(&block)
    10.times do
      yield create_thumbnail
    end
  end

  def create_thumbnail
    thumbnail_styles = <<-THUMB
      margin-bottom: 10px;
      margin-right: 10px;
      display: inline-block;
      vertical-align: bottom;
    THUMB

    image_attributes = <<-IMAGE
      data-width="640"
      data-height="640"
      data-action="zoom"
      style="width: 84px; height: 85px;"
    IMAGE

    %Q(
        <div style="#{thumbnail_styles}">
          <img src="/assets/haircut-emoji.png" #{image_attributes}>
        </div>
    ).html_safe
  end

  private
  def h
    @template
  end

  def avatar_name
    if user.avatar_image_name.present?
      user.avatar_image_name
    else
      "haircut-emoji.png"
    end
  end
end

