module Jekyll
  module JogosdaquiFilters
    def galleryname(input)
      GalleryGenerator::getGalleryName(input)
    end

    def categorytitle(input)
      case input[0]
      when 'News'
        'Notícias'
      when 'Preview'
        'Prévias'
      when 'News'
        'Notícias'
      when 'Game'
        'Jogos'
      when 'Interview'
        'Entrevistas'
      when 'Events'
        'Eventos'
      when 'Column'
        'Colunas'
      when 'Promotion'
        'Promoções'
      else
        input
      end
    end
  end
end
  
Liquid::Template.register_filter(Jekyll::JogosdaquiFilters)