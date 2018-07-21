user = node['ubuntu_i3-gaps_workstation']['user']

# Install the i3-gaps configuration
remote_directory "/home/#{user}/.config/i3" do
  source '.config/i3'
  owner user
  group user
  files_owner user
  files_group user
end
