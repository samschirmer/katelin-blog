Rails.application.routes.draw do

  devise_for :admins
  root 'posts#index'
  resources :posts
	get 'comments/approve/:id' => 'comments#approve', as: :comment_approve
	resources :comments

end
