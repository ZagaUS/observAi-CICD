#!/bin/bash

resource=$1

if [ -z "$resource" ]; then
  echo "Resource not provided. Exiting."
  exit 1
fi

while true; do
    # read -p "Choose a user: " user

    case "$resource" in
        kafka)
            ./scripts/kafka.sh
            break
            ;;
       mongodb)
            ./scripts/mongodb.sh
            break
            ;;
       postgres)
            ./scripts/postgres.sh
            break
            ;;
       otel_collector)
            ./scripts/collector.sh
            break
            ;;
       otel_instrument)
            ./scripts/instrumentation.sh
            break
            ;;
       demo_app)
            ./scripts/demo-applications.sh
            break
            ;;
        quit)
            break
            ;;
        *)
            echo "Resource not provided is not available, 
Choose from resource - kafka, mongodb, postgres, demo_app, otel_collector, otel_instrument
Usage: ./automation.sh <resource>
                  "
            break
            ;;
    esac
done






