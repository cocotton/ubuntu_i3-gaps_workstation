user = node['ubuntu_i3-gaps_workstation']['user']
polybar_repo_path = "#{node['ubuntu_i3-gaps_workstation']['tmp_dir']}/polybar"

# Install required packages listed here: https://github.com/jaagr/polybar/wiki/Compiling
%w[
  cmake
  cmake-data
  pkg-config
  python-xcbgen
  xcb-proto
  libcairo2-dev
  libxcb1-dev
  libxcb-ewmh-dev
  libxcb-icccm4-dev
  libxcb-image0-dev
  libxcb-randr0-dev
  libxcb-util0-dev
  libxcb-xkb-dev
  libxcb-xrm-dev
  libasound2-dev
  libpulse-dev
  libmpdclient-dev
  libiw-dev
  libcurl4-openssl-dev
  libxcb-cursor-dev
  libjsoncpp-dev
  libnl-3-dev
].each do |package|
  package "install_#{package}" do
    package_name package
  end
end

# Clone the polybar repository
git polybar_repo_path do
  repository node['ubuntu_i3-gaps_workstation']['polybar']['repository']['url']
  revision node['ubuntu_i3-gaps_workstation']['polybar']['repository']['revision']
  user user
  group user
  enable_submodules true
end

# Delete the polybar/build directory and its content if it exists
directory "#{polybar_repo_path}/build" do
  recursive true
  action :delete
end

# Create the polybar/build directory
directory "#{polybar_repo_path}/build" do
  user user
  group user
end

# Build polybar
execute 'build_polybar' do
  command 'cmake ..'
  cwd "#{polybar_repo_path}/build"
  user user
  live_stream true
end

# Install polybar
# If the installation does not work, try adding the following line: https://github.com/jaagr/xpp/pull/11/files#diff-4a6135f0407cc0561387e00e9b97e2ffR3142
execute 'install_polybar' do
  command 'make install'
  cwd "#{polybar_repo_path}/build"
  live_stream true
end

# Cleanup
directory polybar_repo_path do
  recursive true
  action :delete
end
