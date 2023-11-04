#!/bin/bash

postgres_installation(){
  helm repo add helm repo add bitnami https://charts.bitnami.com/bitnami
  helm repo add bitnami https://charts.bitnami.com/bitnami
  helm install my-release --set auth.database=observability-demo-tables,auth.username=observability-demo-user,auth.password=observability123 bitnami/postgresql
}

postgres_installation