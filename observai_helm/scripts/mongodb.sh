#!/bin/bash

mongodb_installation(){

        OPERATOR_NAME=""

        OPERATOR_NAME=$(oc get csv --all-namespaces -o custom-columns="NAME:.metadata.name" | grep mongo )
        echo "$OPERATOR_NAME"

    if [[ -n "$OPERATOR_NAME" ]]; then
        # At least one of the specified operators is installed
        OPERATOR_NAMESPACE=$(oc get csv -A --no-headers -o custom-columns="NAMESPACE:.metadata.namespace,NAME:.metadata.name" | grep "$OPERATOR_NAME" | awk '{print $1}')
        echo "Operator Name: $OPERATOR_NAME"
        echo "Operator Namespace: $OPERATOR_NAMESPACE"
        opsmanager_installation
    else
        # None of the specified operators is found
        echo "No supported operator found."
        helm repo add mongodb https://mongodb.github.io/helm-charts
        helm install enterprise-operator mongodb/enterprise-operator --namespace namespace-name
        opsmanager_installation
    fi
    
}
opsmanager_installation(){
    helm install opsmanager mongodb -n $OPERATOR_NAMESPACE
}

mongodb_installation