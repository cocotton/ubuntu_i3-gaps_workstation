# Add the spotify apt repository
apt_repository 'spotify' do
  uri 'http://repository.spotify.com'
  key '931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90'
  distribution 'stable'
  components ['non-free']
end

# Install spotify
package 'install_spotify' do
  package_name 'spotify-client'
end
