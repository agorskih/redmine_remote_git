# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

# following implementation would not actually work because of a way redmine does not allow it
# see: https://www.redmine.org/boards/1/topics/2885?r=17643

get 'git_repositories', :to => 'git_repositories#index'
get 'git_repositories/new', :to => 'git_repositories#new'

resources :git_repositories, :only => [:index, :new]