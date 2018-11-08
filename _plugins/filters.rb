module Jekyll
  module JogosdaquiFilters
    def galleryname(input)
      GalleryGenerator::getGalleryName(input)
    end
  end
end
  
Liquid::Template.register_filter(Jekyll::JogosdaquiFilters)