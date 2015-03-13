Gbase::Engine.routes.draw do

  #get 'permissions/show'

#scope '' do
	#resources :users
  	devise_for :users, class_name: "Gbase::User", module: :devise, :path_prefix => 'acesso', :skip => [:registrations]
  	resources :users
    resources :modulos
    resources :menus
    resources :permissions
    get 'versions/revert'
  	get 'versions/:id/history' =>  'versions#history', :as => "version_history"
  	get 'permissions/:id/grant' => 'permissions#grant',  :as => 'permissions_grant'
#end

end