# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :git_repositories, :only => [:index, :new]