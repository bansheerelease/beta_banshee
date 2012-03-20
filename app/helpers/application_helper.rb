module ApplicationHelper
  def title
    base_title = "Banshee"
    if @title.nil?
      base_title
    else
      "#{base_title} #{@title}"
    end
  end

  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => user.full_name,
                                            :class => 'gravatar round',
                                            :gravatar => options)
  end
end

