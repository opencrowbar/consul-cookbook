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


install_arch = node[:kernel][:machine] =~ /x86_64/ ? 'amd64' : '386'
install_version = [node[:consul][:version], node[:os], install_arch].join('_')
install_checksum = node[:consul][:checksums].fetch(install_version)
install_dir = node[:consul][:install_dir]

package "unzip" do
  not_if "which unzip"
end

bash "Fetch consul for #{install_version}" do
  code <<EOC
set -e
d=$(mktemp -d /tmp/consul-XXXXXX)
cd $d
curl -f -L -O '#{node[:consul][:base_url]}/#{install_version}.zip'
echo '#{install_checksum}  #{install_version}.zip' > sha256sums
sha256sum -c --status sha256sums
unzip "#{install_version}.zip"
mkdir -p #{install_dir}
mv consul #{install_dir}
EOC
end
include_recipe 'consul::_service'
