class UserPresenter < BasePresenter
  presents :user

  def cover_photo
    # "background-image: url(http://placehold.it/1086x448); "
    %Q(background-color: purple;)
  end

  def avatar
    default_avatar_path = "../assets/#{avatar_name}"
    %Q(<img src="#{default_avatar_path}" class="rounded-circle media-object">).
      html_safe
  end

  def full_name
    %Q(<h3 class="profile-header-user">Dave Gamache</h3>).html_safe
  end

  def bio
    bio_text = <<-BIO
      I wish i was a little bit taller, 
      wish i was a baller, wish i had a girl… also.
    BIO

    %Q(<p class="profile-header-bio">#{bio_text}</p>).html_safe
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

