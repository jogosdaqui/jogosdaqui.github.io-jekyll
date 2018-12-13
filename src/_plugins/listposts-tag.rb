module Jekyll
  class ListPostsTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      parts = text.split(' ')
      @begin = parseDate(parts[0])
      @end = parseDate(parts[1])
    end

    def parseDate(value)
      parts = value.split('=')
      date = value.split('=')[1].sub('"', '');
      return Time.parse(date)
    end

    def render(context)
      site = context.registers[:site]
      
      html = "<ul>"
      site.posts.docs.each do |p|
        if p.date >= @begin and p.date <= @end
          html = html + "<li><a href='#{p.url}'>#{p.data['title']}</a></li>" 
        end
      end
      html = html + "</ul>"
      return html
     end
  end
end

Liquid::Template.register_tag('listposts', Jekyll::ListPostsTag)