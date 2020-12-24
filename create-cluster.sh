#!/bin/bash

eksctl create cluster \
--name abcapstone \
--version 1.17 \
--region us-wesr-2 \
--node-type t2.small \
--nodes 3 \
--nodes-min 1 \
--nodes-max 4 \
--managed

eksctl get cluster --name=abcapstone
