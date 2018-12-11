module Jekyll
  module JogosdaquiFilters
    def galleryname(input)
      GalleryGenerator::getGalleryName(input)
    end

    def categorytitle(input)
      case input.gsub /[\[\]"]/, ''
      when 'News'
        return 'Notícias'
      when 'Preview'
        return 'Prévias'
      when 'Game'
        return 'Jogos'
      when 'Interview'
        return 'Entrevistas'
      when 'Event'
        return 'Eventos'
      when 'Column'
        return 'Colunas'
      when 'Promo'
        return 'Promoções'
      else
        return input
      end
    end

    def categoryicon(input)
      case input.gsub /[\[\]"]/, ''
      when 'News'
        iconName = 'newspaper'
      when 'Preview'
        iconName = 'eye'
      when 'Game'
        iconName = 'gamepad'
      when 'Interview'
        iconName = 'comments'
      when 'Event'
        iconName = 'chalkboard-teacher'
      when 'Column'
        iconName = 'comment-alt'
      when 'Promo'
        iconName = 'money-bill-alt'
      end
      
      return "<i class='fas fa-#{iconName}'></i>"
    end

  end
end
  
Liquid::Template.register_filter(Jekyll::JogosdaquiFilters)