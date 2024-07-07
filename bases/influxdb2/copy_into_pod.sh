#!/bin/bash

podname=$( kubectl get pod -n monitoring| grep -i influxdb2 | grep -v helm | awk '{print $1 }' )



kubectl exec -n monitoring -t $podmane rm -rf /bitnami/influxdb/configs /bitnami/influxdb/data /bitnami/influxdb/influxd.bolt /bitnami/influxdb/influxd.sqlite /bitnami/influxdb/replicationq

kubectl -n monitoring cp inf/configs $podname:/bitnami/influxdb/

kubectl -n monitoring cp inf/data/influxd.bolt $postname:/bitnami/influxdb/
kubectl -n monitoring cp inf/data/influxd.sqlite $postname:/bitnami/influxdb/
kubectl -n monitoring cp inf/data/engine/* $postname:/bitnami/influxdb/


kubectl cp configs $podname:/bitnami/influxdb/

