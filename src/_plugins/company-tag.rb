require "i18n"

module Jekyll
  class CompanyTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @companyName = text.strip
    end

    def render(context)
      site = context.registers[:site]
      
      # Utiliza o transliterate para remover os acentos para utilziar na busca da tag.
      I18n.available_locales = [:en]
      companyTag = I18n.transliterate(@companyName.gsub(' ', '-').downcase) 

      # Busca a tag.
      company = site.tags.find {|t| t[0] == companyTag}
     
      if company == nil
        puts "[CompanyTag] WARNING: did not find a company (tag) with name '#{companyTag}'."
        return @companyName;      
      else
        return "<a href=\"#{site.baseurl}/tags/#{companyTag}\">#{@companyName}</a>"
      end
    end
  end
end

Liquid::Template.register_tag('company', Jekyll::CompanyTag)