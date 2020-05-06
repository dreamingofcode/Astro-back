class ApplicationController < ActionController::API
    include ActionController::ImplicitRender
    include ActionController::MimeResponds

  
  
  # config/application.rb
  class Application < Rails::Application
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Allow-Methods' => 'POST, PUT, PATCH, DELETE, GET, OPTIONS',
      'Access-Control-Request-Method' => '*',
      'Access-Control-Allow-Headers' => 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    }
  end
end
  
  # config/routes.rb
  # Last route definition code line
