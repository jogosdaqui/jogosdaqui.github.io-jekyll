Jekyll::Hooks.register :site, :pre_render do |site|
    puts '      Auto reference contents: started'
    
    # POSTS.
    site.posts.docs.sort_by { |p| p.data['title'] }.each do |post|
        content = post.content

        # Ordena os posts do com maior nome para o menor, assim garante que textos como exemplo abaixo não sejam interpretados de forma errada:
        # War of Malquidious: existe um game chamado 'War' e o outro chamado 'War of Malquidious', se não utilizarmos a ordenação do maior nome para o menor
        # teremos o seguinte resultado: <a href="...">War</a> of Malquidious
        site.posts.docs.sort_by { |p| -p.data['title'].size}.each do |referencedPost|
            referencedTitle = referencedPost.data['title'];
            # Se for o mesmo post evita a auto referência e somente considera posts de referência aqueles que 
            # foram escritos antes do post corrente.
            if(post.data['title'] != referencedTitle && post.data['date'] > referencedPost.data['date'])
                referencedTitle = Regexp.quote(referencedTitle);
       
                # Substitui apenas a primeira ocorrência do post referênciado no conteúdo do post, assim evita de ficar criando links repetidos.
                content = content.sub /([^%<\[] \S*[\.,!\? ])(#{referencedTitle})([\.,!\? ])/i, '\1<a href="{{ site.baseurl }}' + referencedPost.url + '">\2</a>\3'
                #content = content.sub /([ \n])(#{referencedTitle})([ \n])/i, '\1<a href="{{ site.baseurl }}' + referencedPost.url + '">\2</a>\3'
                
            end
        end

        if content != post.content
            post.content = content;
            puts "           Post referenced in #{post.data['title']}"
        end
    end

    # TAGS.
    site.tags.sort_by { |t| t[0] }.each do |tagGroup|
        tag = tagGroup[0]
        tagForRegex = tag.gsub '-', ' '
        site.posts.docs.each do |post|
            # Substitui apenas a primeira ocorrência da tag no conteúdo do post, assim evita de ficar criando links repetidos.
            post.content = post.content.sub /([a-z]+[\.,!\?\s])(#{tagForRegex})([\.,!\?\s][a-z]*)/i, '\1<a href="{{ site.baseurl }}/tags/' + tag + '">\2</a>\3'
        end
    end

    puts '      Auto reference contents: done'
end