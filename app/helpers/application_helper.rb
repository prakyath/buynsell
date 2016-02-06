module ApplicationHelper
  def easy_zoom_tag(*args, &block)
    options = args.extract_options!

    content_tag(:div, class: options[:class]) do
      link_to path_to_image(options[:zoom]) do
        image_tag(options[:standard], &block)
      end
    end
  end

end
