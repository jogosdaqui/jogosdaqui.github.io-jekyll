Jekyll::Hooks.register :site, :pre_render do |site|
    puts '      Auto referencing tags: started'
    site.tags.sort_by { |t| t[0] }.each do |tagGroup|
        tag = tagGroup[0]
        tagForRegex = tag.gsub '-', ' '
        # puts "          Tag:#{tagForRegex}"
        site.posts.docs.each do |post|
            # Substitui apenas a primeira ocorrência da tag no conteúdo do post, assim evita de ficar criando links repetidos.
            post.content = post.content.sub /([a-z]+[\.,!\?\s])(#{tagForRegex})([\.,!\?\s][a-z]*)/i, '\1<a href="{{ site.baseurl }}/tags/' + tag + '/">\2</a>\3'
        end
    end
    puts '      Auto referencing tags: donea'
end