user = node['ubuntu_i3-gaps_workstation']['user']

# Copy the fonts directory
remote_directory "/home/#{user}/.fonts" do
  source '.fonts'
  owner user
  group user
  files_owner user
  files_group user
end
