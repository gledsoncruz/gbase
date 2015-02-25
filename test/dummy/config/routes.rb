Rails.application.routes.draw do
  mount Gbase::Engine => "/gbase"
  root 'gbase/home#index'


end
