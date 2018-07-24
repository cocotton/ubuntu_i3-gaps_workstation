user = node['ubuntu_i3-gaps_workstation']['user']
vscode_deb_path = "#{node['ubuntu_i3-gaps_workstation']['tmp_dir']}/vscode.deb"

# Download vscode deb package
remote_file vscode_deb_path do
  source node['ubuntu_i3-gaps_workstation']['vscode']['deb_package']['source']
  owner user
  group user
  notifies :install, 'dpkg_package[install_vscode]', :immediate
  not_if 'dpkg -l | grep " code  "'
end

# Install vscode
dpkg_package 'install_vscode' do
  source vscode_deb_path
  action :nothing
end

# Cleanup vscode deb package
file vscode_deb_path do
  action :delete
end
