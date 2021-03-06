Rails.application.routes.draw do
  # Home
  root :to => "sites#home"

  #Api
  namespace :api, defaults: {format: 'json'} do
    #scope module: :v1, constraints: APIVersion.new(version: 1) do
    scope module: :v1 do
      resources :projects, only: [:index, :show]
      resources :donors, only: [:index, :show]
      resources :organizations, only: [:index, :show]
      resources :sectors, only: [:index, :show]
      resources :countries, only: [:index, :show]
    end
  end

  get 'iati/activities', to: 'api/v1/projects#index', format: 'xml'
  get 'iati/activities/:id', to: 'api/v1/projects#show', format: 'xml'

  mount Raddocs::App => "/docs"

  # report page
  get 'p/analysis', to: 'reports#index' , :as => :report_index
  get 'report_generate', to: 'reports#report', :as => :report_generate
  get 'list', :to => 'reports#list', :as => :report_list
  get 'budgets', :to => 'reports#budgets', :as => :report_budgets
  get 'profile/organization/:id', :to => 'reports#organization_profile', :as => 'report_organization_profile'
  get 'profile/country/:id', :to => 'reports#country_profile', :as => 'report_country_profile'
  get 'profile/sector/:id', :to => 'reports#sector_profile', :as => 'report_sector_profile'
  get 'profile/donor/:id', :to => 'reports#donor_profile', :as => 'report_donor_profile'
  get 'home2' , to: 'sites#home'
  get 'about', to: 'sites#about'
  get 'about-interaction', to: 'sites#about_interaction'
  get 'about-data' , to: 'sites#about_data'
  get 'media', to: 'sites#media'
  get 'testimonials' , to: 'sites#testimonials'
  get 'link-ngo-aid-map' , to: 'sites#link_ngo_aid_map'
  get 'make-your-own-map' , to: 'sites#make_your_own_map'
  get 'faq', to: 'sites#faq'
  get 'contact', to: 'sites#contact'
  get 'explore' , to: 'sites#explore'

  # Session
  resource :session, :only => [:new, :create, :destroy]
  get 'login' , to: 'sessions#new', :as => :login
  get 'logout' , to: 'sessions#destroy', :as => :logout

  resource :passwords

  # Front urls
  # resources :reports
  resources :donors,        :only => [:index, :show]
  resources :offices,       :only => [:show]
  resources :projects,      :only => [:index, :show]
  resources :organizations, :only => [:index, :show]

  # Global Site projects export links for downloading
  get '/sites/download/(:id).csv', :to => 'sites#downloads', :format => :csv
  get '/sites/download/(:id).xls', :to => 'sites#downloads', :format => :xls
  get '/sites/download/(:id).kml', :to => 'sites#downloads', :format => :kml

  get '/download', to: 'downloads#show', as: 'download'

  get 'regions/:id' => 'georegion#old_regions'
  # HACK!! route globbing doesn't work well when trying to get the request format in Rails <=3.0.7
  # get 'location/*ids.csv', to: 'georegion#show', :as => 'location_csv', :format => 'csv'
  # get 'location/*ids.xls' , to: 'georegion#show', :as => 'location_xls', :format => 'xls'
  # get 'location/*ids.kml' , to: 'georegion#show', :as => 'location_kml', :format => 'kml'
  # End HACK!!
  get 'location/:ids' , to: 'georegion#show', :as => 'location'

  # clusters and sector work through the same controller and view
  get 'sectors/:id' , to: 'clusters_sectors#show', :as => 'sector'
  get 'clusters/:id', to: 'clusters_sectors#show', :as => 'cluster'

  # pages
  get '/p/:id' , to:'pages#show', :as => :page
  # search
  get '/search', to: 'search#index', :as => :search
  # list of regions of each level
  get '/geo/regions/1/:id/json' , to: 'georegion#list_regions1_from_country', :format => :json
  get '/geo/regions/2/:id/json' , to: 'georegion#list_regions2_from_country', :format => :json
  get '/geo/regions/3/:id/json' => 'georegion#list_regions3_from_country', :format => :json
end
