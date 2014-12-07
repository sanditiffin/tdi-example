#
# Cookbook Name:: irc
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user 'tdi' do
  comment 'Test Driven Infrastructure'
  home '/Users/tdi'
  manage_home true
  action :create
end

package 'irssi' do
  action :install
end

directory '/Users/tdi/.irssi' do
  owner 'tdi'
  group 'tdi'
end

cookbook_file '/Users/tdi/.irssi/config' do
  source 'irssi-config'
  owner 'tdi'
  group 'tdi'
end
