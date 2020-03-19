set -x
BUILD_IMAGE="kevinearls/jaeger-operator:latest" go test -tags=smokey ./test/e2e/... -v -timeout=20m -kubeconfig "/Users/kearls/.kube/config" -namespacedMan ../../deploy/test/namespace-manifests.yaml -globalMan ../../deploy/test/global-manifests.yaml -root .
