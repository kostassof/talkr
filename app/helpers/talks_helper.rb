module TalksHelper
  def avatar(user)
    email_digest = Digest::MD5.hexdigest(user.email)
    gravatar_url = "//www.gravatar.com/avatar/#{email_digest}"
    image_tag gravatar_url
  end

  def like_button(talk)
    if current_user.liked?(talk)
      link_to "Unlike", unlike_talk_path(talk), method: :delete
    else
      link_to "like", like_talk_path(talk), method: :post
    end
  end
end
