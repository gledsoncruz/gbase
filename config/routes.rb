Gbase::Engine.routes.draw do

#scope '' do
	#resources :users
  	devise_for :users, class_name: "Gbase::User", module: :devise, :path_prefix => 'acesso'
  	resources :users#, :only => :index
    resources :modulos
    resources :menus
    get 'versions/revert'
  	get 'versions/:id/history' =>  'versions#history', :as => "version_history"
#end

end