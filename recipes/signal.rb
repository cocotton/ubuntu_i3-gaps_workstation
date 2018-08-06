# Add the signal apt repository
apt_repository 'signal' do
  uri 'https://updates.signal.org/desktop/apt'
  key 'https://updates.signal.org/desktop/apt/keys.asc'
  distribution 'xenial'
  components ['main']
end

# Install signal and its required package
%w[
  signal-desktop
]. each do |package|
  package "install_#{package}" do
    package_name package
  end
end
