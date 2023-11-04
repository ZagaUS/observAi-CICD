#!/bin/bash

instrumentation(){
    oc apply -f ./collector/instrumentation.yaml
}

instrumentation