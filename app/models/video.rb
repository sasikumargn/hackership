class Video < ActiveRecord::Base
	attr_accessor :name

	# overwrite uploader url method so you can use format in views
	# for example: @post.video.url(:mp4) 
	mount_uploader :movie, VideoUploader do
	 def url(format = nil)
		uploaded_path = encode_path(file.path.sub(File.expand_path(root), ''))
		return uploaded_path if format.nil?
		files = Dir.entries(File.dirname(file.path))
			files.each do |f|
				next unless File.extname(f) == '.' + format.to_s
				return File.dirname(uploaded_path) + '/' + f
			end
	 end		
	end

	## VALIDATIONS
	validates :movie, presence: true

end