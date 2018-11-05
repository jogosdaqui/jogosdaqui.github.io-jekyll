module Jekyll
	class GalleryGenerator < Generator
		def generate(site)
			puts "GENERATING GALLERY..."
			path = 'images/galleries/'
			site.data['galleries'] = {}

			Dir.glob(path + '*/*/*/**/').each do |dir|
				galleries = []
				galleries = Dir.glob(dir +  '*').select {|f| File.directory? f}			

				for gallery in galleries
					galleryName = gallery.dup
					galleryName.sub! path, ''
					galleryName.gsub! '/', '-'
					puts "GALLERY => #{galleryName} = #{gallery}"
					site.data['galleries'][galleryName] = Dir.glob(gallery +  '/*').select {|f| File.file? f};
				end
			end

			puts "site.data['galleries']: #{site.data['galleries']}"
		end
	end
end