Rails.application.routes.draw do
    get    '/admin',        to: 'admin#tasks'
    post   '/import_teams', to: 'admin#import_teams'
end
