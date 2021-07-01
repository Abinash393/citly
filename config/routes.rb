Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
      namespace :v1 do

          resources :links, only: [:create, :index] do
              collection do
                  get '/download/:job_id', to: 'links#download'
                  get :report
                  post :pinned
              end
          end
      end
  end
    
  get '/s/:short_url_id', to: 'home#redirect_to_original_url'
  get '/not-found', to: 'home#four_o_four'
  root "home#index"
#   get '*path', to: 'home#index'
end
