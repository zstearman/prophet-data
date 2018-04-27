Rails.application.routes.draw do
    get    '/admin',        to: 'admin#tasks'
    get    '/conferences',    to: 'conferences#index'
    post   '/import_teams', to: 'admin#import_teams'
end
