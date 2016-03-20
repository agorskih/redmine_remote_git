Redmine::Plugin.register :redmine_remote_git do
  name 'Redmine Remote Git plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end

class MyRoutes < Redmine::Hook::Listener
  def routes(context)
    context[:map].resources :git_repositories
  end
end

Redmine::Hook.add_listener(MyRoutes)