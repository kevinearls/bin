minishift ssh -- 'sudo sysctl -w vm.max_map_count=262144'
minishift addon apply anyuid
#
# On a real OS cluster use
# oc adm policy --namespace storage add-scc-to-group anyuid system:authenticated
# 
