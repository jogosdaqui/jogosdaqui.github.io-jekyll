module Jekyll
  class VimeoTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      '<center>
        <iframe src="https://player.vimeo.com/video/' + @text + '" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
      </center>'
    end
  end
end

Liquid::Template.register_tag('vimeo', Jekyll::VimeoTag)