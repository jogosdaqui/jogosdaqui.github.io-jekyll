Jekyll::Hooks.register :posts, :pre_render do |post|
    galleryName = Jekyll::GalleryGenerator::getGalleryName(post.path)
    gallery = post.site.data['galleries'][galleryName];

    if gallery != nil
      gallery.each do |pic|
        if pic.include? 'logo'
          post.data['logo'] = pic
        end
      end
    end
end