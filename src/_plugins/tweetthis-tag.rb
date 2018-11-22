require 'cgi'

module Jekyll
  class TweetThisTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      site = context.registers[:site]
      siteUrl = site.config['url'];
      preparedText = @text.gsub '{{ site.url }}', siteUrl
      tweetText = CGI.escape(preparedText)
      
      '<a href="https://twitter.com/intent/tweet?text=' + tweetText + '">' + preparedText + '</a>'
    end
  end
end

Liquid::Template.register_tag('tweetthis', Jekyll::TweetThisTag)