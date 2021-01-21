#!/bin/bash

eksctl create cluster \
--name abcapstone4 \
--version 1.17 \
--region us-west-2 \
--nodegroup-name linux-nodes \
--node-type t2.small \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--managed

eksctl get cluster --name=abcapstone5
