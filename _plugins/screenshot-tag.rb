module Jekyll
  class ScreenshotTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      galleryDir = GalleryGenerator::getRelativeDir(context.environments.first['page']['path'])
      "<center>
        <img src='../../../../images/galleries/#{galleryDir}/#{@text}'>
      </center>"
    end
  end
end

Liquid::Template.register_tag('screenshot', Jekyll::ScreenshotTag)