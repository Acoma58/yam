#
# Cookbook Name:: yam
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "screen" do
 action :install
end 

package "numactl" do
 action :install
end 

template "/etc/init.d/yam" do
  source "yam.erb"
  owner "root"
  group "root"
  mode "0755"
  variables({
    :user => node[:yam][:sysuser]
  })
end

remote_file "/var/tmp/yam.tar.gz" do
  source "https://s3-us-west-2.amazonaws.com/ad54c1-www/yam.tar.gz"
  mode 0644
  action :create
end

execute "unpack_run_yam" do
  command <<-EOF
    cd /var/tmp && tar xvpf /var/tmp/yam.tar.gz
  EOF
  creates "/var/tmp/yam"
end

service "yam" do
  action [ :enable, :stop ]
  supports :restart =>false, :status => false
end

execute "doit" do
  command <<-EOF
   /etc/init.d/yam stop 
   /etc/init.d/yam start
  EOF
end
