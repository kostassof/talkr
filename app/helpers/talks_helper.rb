module TalksHelper
  def talk_form_for(content_type)
    form_for(Talk.new, url: content_type.new) do |form|
      form.hidden_field(:content_type, value: content_type) +
      form.fields_for(:content) { |content_form| yield(content_form) } +
      form.submit("Talk.")
    end
  end

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
