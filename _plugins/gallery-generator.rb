module Jekyll
	class GalleryGenerator < Generator
		def generate(site)
			puts "GENERATING GALLERIES..."
			site.data['galleries'] = {}

			Dir.glob('images/galleries/*/*/*/**/').each do |dir|
				galleries = []
				galleries = Dir.glob(dir +  '*').select {|f| File.directory? f}			

				for gallery in galleries
					galleryName = GalleryGenerator::getGalleryName(gallery)
					# puts "GALLERY => #{galleryName} = #{gallery}"

					site.data['galleries'][galleryName] = Dir.glob(gallery +  '/*').select {|f| File.file? f};
				end
			end

			puts "GALLERIES GENERATED."
			# puts "site.data['galleries']: #{site.data['galleries']}"
		end

		def self.getGalleryName(folder)
			galleryName = folder.dup
			galleryName.sub! 'images/galleries/', ''
			galleryName.gsub! '/', '-'
			galleryName.sub! '_posts-', ''
			galleryName.sub! '.md', ''

			return galleryName;
		end 

		def self.getRelativeDir(folder)
			galleryDir = getGalleryName(folder);
			galleryDir.sub!(/(\d{4})-(\d{2})-(\d{2})-/, '\\1/\\2/\\3/')
		
			return galleryDir;
		end 
	end
end