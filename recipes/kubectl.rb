# Add the kubectl apt repository
apt_repository 'kubectl' do
  uri 'http://apt.kubernetes.io/'
  key 'https://packages.cloud.google.com/apt/doc/apt-key.gpg'
  distribution 'kubernetes-xenial'
  components ['main']
end

# Install kubectl and its required package
%w[
  apt-transport-https
  kubectl
]. each do |package|
  package "install_#{package}" do
    package_name package
  end
end
