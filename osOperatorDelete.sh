oc delete -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/crds/jaegertracing.io_jaegers_crd.yaml 
oc delete -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/service_account.yaml
oc delete -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/role.yaml
oc delete -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/role_binding.yaml
oc delete -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/operator.yaml
kubectl delete namespace observability 
