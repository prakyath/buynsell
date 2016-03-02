class Railtie < Rails::Railtie
  initializer 'easy_zoom.initialize_easy_zoom_helper' do |app|
    ActiveSupport.on_load(:action_view) do
      include EasyZoom
    end
  end
end