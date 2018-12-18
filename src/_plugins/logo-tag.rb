module Jekyll
  class LogoTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      galleryDir = GalleryGenerator::getRelativeDir(context.environments.first['page']['path'])
      site = context.registers[:site]

      "<center>
        <img class='lazy' src='#{site.baseurl}/assets/#{galleryDir}/#{@text}'>
      </center>"
    end
  end
end

Liquid::Template.register_tag('logo', Jekyll::LogoTag)