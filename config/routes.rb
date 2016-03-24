# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

# following implementation would not actually work because of a way redmine does not allow it
# see: https://www.redmine.org/boards/1/topics/2885?r=17643

resources :git_repositories, :only => [:index, :new, :create, :destroy]

post 'git_repository/:id/clone', to: => 'git_repositories#clone' as: 'git_repository_clone'