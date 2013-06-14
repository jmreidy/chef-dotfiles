include_recipe 'git'

def user_home
  Etc.getpwnam(node['dotfiles']['user']).dir
end

def destination
  "#{user_home}/#{node['dotfiles']['destination']}"
end

git "#{destination}" do
  repository node['dotfiles']['repository']
  reference node['dotfiles']['reference']
  user node['dotfiles']['user']
  group node['dotfiles']['group']
  enable_submodules true
  action :sync
end
