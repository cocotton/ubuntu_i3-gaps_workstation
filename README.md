# ubuntu_i3-gaps_workstation

A Chef cookbook to provision an Ubundu with i3-gaps workstations.

## Requirements

1. ChefDK
  * Download the latest version: https://downloads.chef.io/chefdk
  * Install with `sudo dpkg -i chefdk_VERSION_amd64.deb` 

## Usage

1. Clone this repository
2. Update the `solo.rb` and make it point to the directory containing this repository
3. Check out [`attributes/default.rb`](attributes/default.rb) for what can be configured.
4. Run it `sudo chef-solo -c solo.rb -o 'recipe[ubuntu_i3-gaps_workstation]'` 

## Contributing

1. Fork it
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :)

