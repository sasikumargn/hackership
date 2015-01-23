module ApplicationHelper

	def video_tag(*sources)
    multiple_sources_tag('video', sources) do |options|
      options[:poster] = path_to_image(options[:poster]) if options[:poster]
      options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]
    end
  end

  def multiple_sources_tag(type, sources)
    options = sources.extract_options!.symbolize_keys
    sources.flatten! unless sources.flatten.map{|m| m.kind_of?(Hash)}.include?(true)
    yield options if block_given?
    if sources.size > 1
      content_tag('video', options) do
        safe_join sources.map {|source|
          file_type_option = source.extract_options! if source.kind_of?(Array)
          if (source.kind_of?(Array) && file_type_option.present? && file_type_option.kind_of?(Hash)) 
            tag("source", :src => send("path_to_video", source.first), :type => file_type_option[:type]) 
          else
             tag("source", :src => send("path_to_video", source))
          end
        }
      end
    else
      options[:src] = send("path_to_video", sources.first)
      content_tag('video', nil, options)
    end
  end

end
