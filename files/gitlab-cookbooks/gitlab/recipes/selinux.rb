#
# Copyright:: Copyright (c) 2014 GitLab B.V.
# License:: Apache License, Version 2.0
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

if RedhatHelper.system_is_rhel7?
  ssh_keygen_module = 'gitlab-7.2.0-ssh-keygen'
  execute "semodule -i /opt/gitlab/embedded/selinux/rhel/7/#{ssh_keygen_module}.pp" do
    not_if "semodule -l | grep '^#{ssh_keygen_module}\\s'"
  end
end
