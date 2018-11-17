module Jekyll
  class CaptionTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      galleryDir = GalleryGenerator::getRelativeDir(context.environments.first['page']['path'])
      "<center><span style='font-style:italic; font-size:small'>#{@text}</span></center>"
    end
  end
end

Liquid::Template.register_tag('caption', Jekyll::CaptionTag)