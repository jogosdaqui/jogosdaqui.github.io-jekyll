require 'cgi'

module Jekyll
  class TweetThisTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      '<a href="https://twitter.com/intent/tweet?text=' + CGI.escape(@text) + '">' + @text + '</a>'
    end
  end
end

Liquid::Template.register_tag('tweetthis', Jekyll::TweetThisTag)