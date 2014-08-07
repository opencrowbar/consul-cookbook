#
# Copyright 2014 John Bellone <jbellone@bloomberg.net>
# Copyright 2014 Bloomberg Finance L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default[:consul][:base_url] = 'https://dl.bintray.com/mitchellh/consul/'
default[:consul][:version] = '0.3.1'
default[:consul][:install_dir] = '/usr/local/bin'
default[:consul][:checksums] = {
  '0.3.1_darwin_amd64' => 'e310d54244b207702143f1667d61bf0147d1bd656a29496d8b58eea07078d1dc',
  '0.3.1_linux_386'    => '9b8340fdf464a99fc9dc108115602c761b703a16277fbd9f4f164123cf2a9f11',
  '0.3.1_linux_amd64'  => 'c33da8ac24f01eefe8549e8d4d301b4e18a71b61f06ae1377a88ccd6eab2cfbb',
  '0.3.1_web_ui'       => 'd8982803fffb84d3202260161f6310bd6bddb5b12bf690cf00210cd659a31ddd',
  '0.3.1_windows_386'  => '102bda6e02b193a9417e80795875bf7d18259fc5daff3d048d274beef690eb26'
}

# Service attributes
default[:consul][:service_mode] = 'bootstrap'
default[:consul][:data_dir] = '/var/lib/consul'
default[:consul][:config_dir] = '/etc/consul.d'
default[:consul][:servers] = []

# UI attributes
default[:consul][:client_addr] = '0.0.0.0'
default[:consul][:ui_dir] = '/var/lib/consul/ui'
default[:consul][:serve_ui] = false
