minishift ssh -- 'sudo sysctl -w vm.max_map_count=262144'
minishift addon apply anyuid
