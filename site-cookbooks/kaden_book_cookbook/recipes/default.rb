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

rbenv_ruby "2.2.4" do
  global true
end

rbenv_gem "bundler" do
  ruby_version "2.2.4"
end
