module Jekyll
  class CompanyTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @companyName = text.strip
    end

    def render(context)
      site = context.registers[:site]
      companyTag = @companyName.gsub(' ', '-').downcase
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