#
# Cookbook Name:: vagrant-appserver
# Recipe:: default
#

include_recipe "appserver::default"

search( :users, 'shell:*zsh AND NOT action:remove' ).each do |u|
  user_id = u["id"]

  template "/home/#{user_id}/.oh-my-zsh/themes/agnoster2.zsh-theme" do
    source 'agnoster2.zsh-theme'
    owner 'deploy'
    group 'deploy'
    mode '0644'
    only_if { ::File.directory?("/home/#{user_id}/.oh-my-zsh/themes") }
  end
end
