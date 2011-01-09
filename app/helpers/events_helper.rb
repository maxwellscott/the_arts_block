module EventsHelper
  def embed_element(external_video)
    content_tag(:embed, '', :src => @event.youtube_url)
  end
end
