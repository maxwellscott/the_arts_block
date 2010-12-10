module ApplicationHelper

  def title
    base_title = "::theArtsBlock::"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end    
  end

  def deny_access
    redirect_to root_path, :notice => "You can't do that."
  end

  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def ab
    ab = image_tag("artsblock.png", :alt => "theartsblock.com", :mouseover => "artsblock-mo.png")
  end

  def pushkin
    pushkin = image_tag("pushkin.png", :alt => "thepushkin.com", :mouseover => "pushkin-mo.png")
  end

  def blog
    blog = image_tag("blog.png", :alt => "ArtsBlock BlogTalk", :mouseover => "blog-mo.png")
  end

end
