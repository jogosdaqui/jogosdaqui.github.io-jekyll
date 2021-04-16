module Jekyll
  class FacebookVideoTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      '<center>
        <div class="fb-video" data-href="' + @text +'" data-width="500" data-show-text="false"></div>
      </center>'
    end
  end
end

Liquid::Template.register_tag('fbvideo', Jekyll::FacebookVideoTag)