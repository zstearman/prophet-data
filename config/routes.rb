Rails.application.routes.draw do
    root   'static_pages#home'
    get    '/admin',        to: 'admin#tasks'
    get    '/conferences',  to: 'conferences#index'
    get    '/teams',        to: 'teams#index'
    post   '/import_teams', to: 'admin#import_teams'
end
