module ListingHelper
  def embed_element(external_video)
    content_tag(:embed, '', :src => event.youtubeUrl)
  end
end
