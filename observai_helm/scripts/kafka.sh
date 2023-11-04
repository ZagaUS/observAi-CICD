#!/bin/bash

kafka_installation(){

    operators=("amq" ,"strimzi" , "kafka")

    # Get the CSVs in the specified namespace and filter based on operator names
    OPERATOR_NAME=""
    for operator in "${operators[@]}"; do
        OPERATOR_NAME=$(oc get csv --all-namespaces -o custom-columns="NAME:.metadata.name" | grep $operator )
        echo "$OPERATOR_NAME"
        if [[ -n "$OPERATOR_NAME" ]]; then
            # Operator found, break the loop
            break
        fi
    done


    if [[ -n "$OPERATOR_NAME" ]]; then
        # At least one of the specified operators is installed
        OPERATOR_NAMESPACE=$(oc get csv -A --no-headers -o custom-columns="NAMESPACE:.metadata.namespace,NAME:.metadata.name" | grep "$OPERATOR_NAME" | awk '{print $1}')
        echo "Operator Name: $OPERATOR_NAME"
        echo "Operator Namespace: $OPERATOR_NAMESPACE"
        kafka_kind_installation
    else
        # None of the specified operators is found
        echo "No supported operator found."
        helm repo add strimzi https://strimzi.io/charts/
        helm install kafka-operator-name strimzi/strimzi-kafka-operator --namespace namespace-name
        kafka_kind_installation
    fi
}
kafka_kind_installation(){
    helm install kafka kafka -n $OPERATOR_NAMESPACE
}

kafka_installation