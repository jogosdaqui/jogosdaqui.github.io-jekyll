var jd = {
    getIcon: function getIcon(post) {
        switch(post.category) {
            case 'News':
                return "{{ 'News' | categoryicon }}";
            case 'Preview':
                return "{{ 'Preview' | categoryicon }}";
            case 'Game':
                return "{{ 'Game' | categoryicon }}";
            case 'Interview':
                return "{{ 'Interview' | categoryicon }}";
            case 'Event':
                return "{{ 'Event' | categoryicon }}";
            case 'Column':
                return "{{ 'Column' | categoryicon }}";
            case 'Promo':
                return "{{ 'Promo' | categoryicon }}";
        }
    },
    getCategory: function getCategory(post) {
        switch(post.category) {
            case 'News':
                return "{{ 'News' | categorytitle }}";
            case 'Preview':
                return "{{ 'Preview' | categorytitle }}";
            case 'Game':
                return "{{ 'Game' | categorytitle }}";
            case 'Interview':
                return "{{ 'Interview' | categorytitle }}";
            case 'Event':
                return "{{ 'Event' | categorytitle }}";
            case 'Column':
                return "{{ 'Column' | categorytitle }}";
            case 'Promo':
                return "{{ 'Promo' | categorytitle }}";
        }
    },
    escapeRegex: function escapeRegex(string) {
        return string.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'); // $& means the whole matched string
    },
    initializeHightlightBox: function(title, category, tag) {
        var inview = new Waypoint.Inview({
            element: $(".highlight-box-title:contains(" + title + ")")[0],
            enter: function(direction) {
                // Já foi inicializado?
                if($("[list='" + title + "'] li").length > 0)
                    return;
                
                $.getJSON("{{ site.baseurl }}/search.json", function(json) {
                    function addItem(post) {
                        var sanitizedTitle = post.title.replace(/&#39;/g, "'")
                        sanitizedTitle = sanitizedTitle.replace(/&amp;#39;/g, "'")
                        
                        $("[list='" + title + "']").append("<li><a href='" + post.url + "'>" + sanitizedTitle + "</a></li>");
                    }
                    
                    var posts = $(json).filter(function (i,p) {
                        var selected = true;

                        if (category != '')
                            selected = p.category == category;
                
                        if (selected && tag != '')
                            selected = $.inArray(tag, p.tags.split(', ')) != -1;
                        
                        return selected;
                    });

                    var indexes = [];

                    for(var i = 0; i < 3 && i < posts.length; i++)
                    {
                        
                        do {
                            var index = Math.floor(Math.random() * posts.length);
                        } while($.inArray(index, indexes) != -1)

                        indexes.push(index);
                        addItem(posts[index]);
                    }        
                });
            }
        });
    }
}
