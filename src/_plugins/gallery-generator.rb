module Jekyll
	class GalleryGenerator < Generator
		def generate(site)
			site.data['galleries'] = {}

			Dir.glob('assets/*/*/*/*').each do |dir|
				galleryName = GalleryGenerator::getGalleryName(dir)
				site.data['galleries'][galleryName] = Dir.glob(dir +  '/*')
				.select {|f| File.file? f}
				.sort_by {|f| f}
			end
		end

		def self.getGalleryName(folder)
			galleryName = folder.dup
			galleryName.sub! /.+\/_posts\//, ''
			galleryName.sub! 'assets/', ''
			galleryName.sub! /\d{4}\/(\d{4})/, '\1'
			galleryName.gsub! '/', '-'
			galleryName.sub! '_posts-', ''
			galleryName.sub! '.md', ''
			return galleryName;
		end 

		def self.getRelativeDir(folder)
			galleryDir = getGalleryName(folder);
			galleryDir.sub!(/(\d{4})-(\d{2})-(\d{2})-/, '\1/\2/\3/')
		
			return galleryDir;
		end 
	end
end