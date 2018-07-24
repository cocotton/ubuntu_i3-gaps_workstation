default['ubuntu_i3-gaps_workstation']['user'] = ''
default['ubuntu_i3-gaps_workstation']['tmp_dir'] = "/home/#{node['ubuntu_i3-gaps_workstation']['user']}/Tmp"

default['ubuntu_i3-gaps_workstation']['golang']['version'] = '1.10.3'

default['ubuntu_i3-gaps_workstation']['i3-gaps']['install'] = true
default['ubuntu_i3-gaps_workstation']['i3-gaps']['repo_url'] = 'https://github.com/Airblader/i3.git'

default['ubuntu_i3-gaps_workstation']['light']['install'] = true
default['ubuntu_i3-gaps_workstation']['light']['repo_url'] = 'https://github.com/haikarainen/light.git'

default['ubuntu_i3-gaps_workstation']['playerctl']['deb_package']['source'] = 'https://github.com/acrisci/playerctl/releases/download/v0.6.1/playerctl-0.6.1_amd64.deb'
default['ubuntu_i3-gaps_workstation']['playerctl']['deb_package']['checksum'] = '2d03a17d4d9220e6fa2e71f9ba050ccbb90a321f84624b68c483f0769f4796f4'

default['ubuntu_i3-gaps_workstation']['polybar']['install'] = true
default['ubuntu_i3-gaps_workstation']['polybar']['repository']['revision'] = '3.1.0'
default['ubuntu_i3-gaps_workstation']['polybar']['repository']['url'] = 'https://github.com/jaagr/polybar'

default['ubuntu_i3-gaps_workstation']['slack']['version'] = '3.2.1'

default['ubuntu_i3-gaps_workstation']['termite']['install'] = true
default['ubuntu_i3-gaps_workstation']['termite']['repository']['url'] = 'https://github.com/thestinger/termite.git'
default['ubuntu_i3-gaps_workstation']['termite']['repository']['revision'] = 'master'
default['ubuntu_i3-gaps_workstation']['termite']['vte-ng']['repository']['url'] = 'https://github.com/thestinger/vte-ng.git'
default['ubuntu_i3-gaps_workstation']['termite']['vte-ng']['repository']['revision'] = '0.50.2-ng'
