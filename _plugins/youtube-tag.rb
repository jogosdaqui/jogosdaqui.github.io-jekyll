module Jekyll
  class YouTubeTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      '<center>
        <iframe src="https://www.youtube.com/embed/' + @text + '" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
      </center>'
    end
  end
end

Liquid::Template.register_tag('youtube', Jekyll::YouTubeTag)