Rails.application.routes.draw do
  resources :games do

  delete 'delete_image/:image_id', on: :member, to: 'games#delete_image', as: 'delete_image'

end

  root 'games#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
