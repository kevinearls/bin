kubectl create namespace observability
kubectl create -n observability -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/crds/jaegertracing.io_jaegers_crd.yaml
kubectl create -n observability -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/service_account.yaml
kubectl create -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/cluster_role.yaml
kubectl create -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/cluster_role_binding.yaml

#kubectl create -n observability -f https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/operator.yaml
# Get the operator.yaml and update it to use my image and apply to all namespaces in the cluster
if [ -z "${BUILD_IMAGE}" ] ; then
  export BUILD_IMAGE="kevinearls/jaeger-operator:latest"
fi
curl --silent -LO https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/operator.yaml
sed -i "s@image:.*@image: $BUILD_IMAGE@g" operator.yaml
sed -i '0,/valueFrom:/ s/valueFrom:/value: ""/' operator.yaml
sed -i '0,/fieldRef:/ s/fieldRef/#fieldRef/' operator.yaml
sed -i '0,/fieldPath:/ s/fieldPath/#fieldPath/' operator.yaml

kubectl create -n observability -f ./operator.yaml




