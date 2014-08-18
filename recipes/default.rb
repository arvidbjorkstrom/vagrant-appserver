#
# Cookbook Name:: vagrant-appserver
# Recipe:: default
#

include_recipe "appserver::default"

template "/home/deploy/.oh-my-zsh/themes/agnoster2.zsh-theme" do
	source "agnoster2.zsh-theme"
	owner "deploy"
	group "deploy"
	mode "0644"
end
