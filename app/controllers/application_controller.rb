class ApplicationController < ActionController::API
    include ActionController::ImplicitRender
    include ActionController::MimeResponds
  
    def cors_preflight_check
      headers['Access-Control-Max-Age'] = '1728000'
  
      render json: {} # Render as you need
    end
  end
  
  
  # config/application.rb
  class Application < Rails::Application
    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Allow-Methods' => 'POST, PUT, PATCH, DELETE, GET, OPTIONS',
      'Access-Control-Request-Method' => '*',
      'Access-Control-Allow-Headers' => 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    }
  end
  
  
  # config/routes.rb
  # Last route definition code line
  match '*path', to: 'application#cors_preflight_check', via: [:options]