user = node['ubuntu_i3-gaps_workstation']['user']
playerctl_deb_path = "#{node['ubuntu_i3-gaps_workstation']['tmp_dir']}/playerctl.deb"

remote_file playerctl_deb_path do
  source node['ubuntu_i3-gaps_workstation']['playerctl']['deb_package']['source']
  checksum node['ubuntu_i3-gaps_workstation']['playerctl']['deb_package']['checksum']
  owner user
  group user
end

dpkg_package 'playerctl.deb' do
  source playerctl_deb_path
end
