Rails.application.routes.draw do
    devise_for :admins, path: 'admin/admins', controllers: {
	  sessions:      'admin/admins/sessions',
	  passwords:     'admin/admins/passwords',
	  registrations: 'admin/admins/registrations'
	}
	devise_for :users, controllers: {
	  sessions:      'user/users/sessions',
	  passwords:     'user/users/passwords',
	  registrations: 'user/users/registrations'
	}


	namespace :admin, path: 'admin' do
		root 'home#index', as: :root
		resources :admins, only: [:index, :new, :create, :edit, :update, :delete]
		resources :items
		resources :artists do
			get :autocomplete_artist_name, on: :collection
		end
		resources :labels do
			get :autocomplete_label_name, on: :collection
		end
		resources :genres
		resources :users, only: [:index, :show, :edit, :update]
		resources :recommended_items
	end

    root to: 'user/users#top'

	namespace :user, path: 'user' do
		resources :items, only: [:index, :show] do
			resources :cart_items, only: [:create, :update, :destroy]
		end
		get '/user/carts/create/:id' => 'carts#create', as: 'cart_item_create'

		resources :artists, only: [:index, :show]
		resources :genres, only: [:index, :show]
		resources :favorites, only: [:index, :destroy]
		resources :carts, only: [:show, :update, :destroy]
        resources :order, only: [:show, :new]

        post '/purchase_complete' => 'order#purchase_complete'
        # post '/create' => 'cart_items#create'

        #get '/add_item' => 'carts#show'
        post '/update' => 'carts#update'
  		delete '/delete' => 'carts#delete'

    end
  		get '/user/leave' => 'user/leaves#index', as: 'user_leave'

        #お気に入り機能実装routing
        resource :sessions, only: [:new, :create, :destroy]

		resources :items do
		    member do #item一覧画面からお気に入り登録をする
		      post "add", to: "user/favorites#create"
		    end
		  end



		resources :items, only: [:index]
		# get 'top' => 'users#top'
		scope module: :user do
			resources :users, only: [:show]
		end

		devise_scope :social_account do
			get 'sign_out', to: "sessions#destroy"
		end

	end
