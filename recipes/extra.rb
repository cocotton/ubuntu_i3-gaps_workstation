# Install extra packages
%w[
  i3lock
  compton
  rofi
  feh
  ranger
  glances
  scrot
  ubuntu-restricted-extras
  hsetroot
  curl
  jq
  virtualbox
  vagrant
  lxappearance
  arc-theme
  vlc
].each do |package|
  package "install_#{package}" do
    package_name package
  end
end
