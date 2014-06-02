# node[:sysuser] = ec2-user | vzcloud | ubuntu | root | etc

  default["yam"]["sysuser"] = "vzcloud"

#case node['cloud']['provider']
#when 'aws' 
#  if node[platform] == 'ubuntu'
#    default['yam']['sysuser'] = 'ubuntu' 
#  else default['yam']['sysuser'] = 'ec2-user' 
#  end 
#when 'verizon'
#  default['yam']['sysuser'] = 'vzcloud' 
#when 'rackspace' 
#  default['yam']['sysuser'] = 'root' 
#else default['yam']['sysuser'] = 'ubuntu'
#end
