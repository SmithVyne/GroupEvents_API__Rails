Rails.application.routes.draw do
  resources :group_events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  get '/drafts' => 'group_events#draftEvents'
  get '/publishes' => 'group_events#publishedEvents'
  
  get '/deletes' => 'group_events#removedEvents'
end
