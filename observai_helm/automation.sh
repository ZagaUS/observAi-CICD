#!/bin/bash

# kafka_installation(){
#     helm repo add strimzi https://strimzi.io/charts/
#     helm install strimzi-kafka-operator strimzi/strimzi-kafka-operator
#     kubectl apply -f kafka.yaml
# }

# mongodb_installation(){
#     helm repo add mongodb https://mongodb.github.io/helm-charts
#     helm install enterprise-operator mongodb/enterprise-operator
#     kubectl apply -f opsmanager.yaml
#     kubectl apply -f mongodb.yaml
#     kubectl apply -f mongodb.yaml
# }

# collector_installation(){
#     helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
#     helm repo update
#     helm install --set admissionWebhooks.certManager.enabled=false --set admissionWebhooks.certManager.autoGenerateCert=true opentelemetry-operator open-telemetry/opentelemetry-operator
#     kubectl apply -f collector.yaml
# }

postgres_installation(){
    helm repo add postgres-operator-charts https://opensource.zalando.com/postgres-operator/charts/postgres-operator
    helm install postgres-operator postgres-operator-charts/postgres-operator
    helm repo add postgres-operator-ui-charts https://opensource.zalando.com/postgres-operator/charts/postgres-operator-ui
    helm install postgres-operator-ui postgres-operator-ui-charts/postgres-operator-ui
    # to view the ui of the database use the next command and then on the browser look on the localhost:8081
    kubectl port-forward svc/postgres-operator-ui 8081:80 
}
# demo_apps_installation(){
#     helm install instrumented-apps ./demo_applications 
# }

# observai_apps_installation(){
#     helm install observai ./observai-app
# }

# kafka_installation
# mongodb_installation
# collector_installation
postgres_installation
# demo_apps_installation
# observai_apps_installation