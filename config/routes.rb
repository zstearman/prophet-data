Rails.application.routes.draw do
    root   'static_pages#home'
    get    '/admin',        to: 'admin#tasks'
    get    '/conferences',  to: 'conferences#index'
    get    '/teams',        to: 'teams#index'
    get    '/seasons',      to: 'seasons#index'
    post   '/get_team_seasons', to: 'admin#get_team_seasons'
    post   '/get_games',    to: 'admin#get_games'
    get    '/get_teams',    to: 'admin#get_teams'
    get    '/get players',  to: 'admin#get_players'
    resources :teams, only: [:index, :show]
    resources :conferences, only: [:index, :show]
    resources :seasons, only: [:index, :show]
    resources :games, only: [:index]
end
