Rails.application.routes.draw do
  mount Gbase::Engine => "/gbase"
  root to: 'gbase/home#index'


end
