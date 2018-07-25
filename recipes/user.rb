user = node['ubuntu_i3-gaps_workstation']['user']

# Dummy recipe used by test-kitchen to have a basic functional user
user user do
  home "/home/#{user}"
  manage_home true
end
