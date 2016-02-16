#
# Cookbook Name:: kaden_book_cookbook
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'simple_iptables'
include_recipe 'ruby_build'
# simple_iptables_policy "INPUT" do
#   policy "DROP"
# end

%w(sqlite-devel nodejs).each do |name|
  package name do
    action :install
  end
end

rbenv_ruby "2.2.4" do
  global true
end

rbenv_gem "bundler" do
  ruby_version "2.2.4"
end

include_recipe "passenger_apache2"

web_app "myproj" do
  cookbook "passenger_apache2"
  docroot "/opt/kadenpotal/public"
  server_name "myproj.#{node[:domain]}"
  server_aliases [ "myproj", node[:hostname] ]
  rails_env "production"
end
