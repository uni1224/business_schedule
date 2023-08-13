Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "users/mypage" => "users#show", as: "mypage"
  get 'users/information/edit' => 'users#edit', as: 'edit_information'
  patch 'users/information' => 'users#update', as: 'update_information'
  get 'users/quit' => 'users#quit', as: 'confirm_quit'
  put 'users/information' => 'users#update'
  patch 'users/out' => 'users#out', as: 'out_user'
end
