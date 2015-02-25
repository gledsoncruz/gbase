Gbase::Engine.routes.draw do

#scope '' do
	#resources :users
  	devise_for :users, class_name: "Gbase::User", module: :devise, :path_prefix => 'acesso'
  	resources :users#, :only => :index
#end

end