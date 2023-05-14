# frozen_string_literal: true

Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username),
                                                ::Digest::SHA256.hexdigest(ENV['SIDEKIQ_WEB_USER'])) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password),
                                                  ::Digest::SHA256.hexdigest(ENV['SIDEKIQ_WEB_PASSWORD']))
  end

  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :users, :controllers => {registrations: 'users/registrations', sessions: 'users/sessions'} 
  get 'healthz', to: 'v1/home#healthz'
  root 'v1/home#dashboard'
end
