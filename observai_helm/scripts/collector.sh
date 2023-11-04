#!/bin/bash

collector_installation(){
    oc apply -f ./collector/collector.yaml -n testing-workspace
}
collector_installation