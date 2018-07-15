# Install required packages listed here: https://github.com/Airblader/i3/wiki/Compiling-&-Installing#1610-
%w[
  libxcb1-dev
  libxcb-keysyms1-dev
  libpango1.0-dev
  libxcb-util0-dev
  libxcb-icccm4-dev
  libyajl-dev
  libstartup-notification0-dev
  libxcb-randr0-dev
  libev-dev
  libxcb-cursor-dev
  libxcb-xinerama0-dev
  libxcb-xkb-dev
  libxkbcommon-dev
  libxkbcommon-x11-dev
  autoconf
  libxcb-xrm0
  libxcb-xrm-dev
  automake
].each do |package|
  package "install_#{package}" do
    package_name package
  end
end

# Clone the i3-gaps repository
#git "/home/#{node['ubuntu_i3-gaps_workstation']['user']}/"
