module Jekyll
  class SoundCloudTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      '<center>
      <iframe 
        width="100%" 
        height="300" 
        scrolling="no" 
        frameborder="no" 
        allow="autoplay" 
        src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/' + @text.delete(' ') + '&color=%23ff5500&auto_play=true&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true"
      >
      </iframe>
      </center>'
    end
  end
end

Liquid::Template.register_tag('soundcloud', Jekyll::SoundCloudTag)