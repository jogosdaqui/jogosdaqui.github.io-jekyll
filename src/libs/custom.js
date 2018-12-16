let jd = {
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
      }
}
