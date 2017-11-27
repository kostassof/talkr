module TalksHelper
  def like_button(talk)
    if current_user.liked?(talk)
      link_to "Unlike", unlike_talk_path(talk), method: :delete
    else
      link_to "like", like_talk_path(talk), method: :post
    end
  end

  def autolink(text)
    text.gsub(/@\w+/) { |mention| link_to mention, user_path(mention[1..-1]).html_safe }
  end
end
