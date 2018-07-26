user = node['ubuntu_i3-gaps_workstation']['user']
slack_deb_path = "#{node['ubuntu_i3-gaps_workstation']['tmp_dir']}/slack.deb"

# Install required packages
%w[
  libnotify4
  xdg-utils
  gvfs-bin
  gconf2
  gconf2-common
  gvfs
  gvfs-common
  desktop-file-utils
  libgconf-2-4
  gconf-service-backend
  gconf-service
  libgnome-keyring0
  libgnome-keyring-common
  gir1.2-gnomekeyring-1.0
  libindicator7
  libappindicator1
].each do |package|
  package "install_#{package}" do
    package_name package
    ignore_failure true
  end
end

# There are some dependencies issues with the required packages, but apt --fix-broken fixes everything
execute 'apt_fix-broken_install' do
  command 'apt --fix-broken install -y'
  live_stream true
  not_if 'dpkg -l | grep slack-desktop'
end

# Download slack deb package
remote_file slack_deb_path do
  source "https://downloads.slack-edge.com/linux_releases/slack-desktop-#{node['ubuntu_i3-gaps_workstation']['slack']['version']}-amd64.deb"
  owner user
  group user
  notifies :install, 'dpkg_package[install_slack]', :immediate
  not_if 'dpkg -l | grep slack-desktop'
end

# Install slack
dpkg_package 'install_slack' do
  source slack_deb_path
  action :nothing
end

# Cleanup slack deb package
file slack_deb_path do
  action :delete
end
