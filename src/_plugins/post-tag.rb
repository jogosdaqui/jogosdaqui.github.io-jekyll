module Jekyll
  class PostTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @postTitle = text.strip
    end

    def render(context)
      site = context.registers[:site]
      post =  site.posts.docs.find {|p| p.data['title'] == @postTitle}

      if post == nil
        puts "[PostTag] WARNING: did not find a post with title '#{@postTitle}'."
        return @postTitle;
      else
        return "<a href=\"#{site.baseurl}#{post.url}\">#{@postTitle}</a>"
      end
    end
  end
end

Liquid::Template.register_tag('post', Jekyll::PostTag)