#!/bin/bash

echo "[TASK 1] Pull required containers"
# 国内环境会卡死在这，采用下面曲线救国的方式来解决
# kubeadm config images pull >/dev/null 2>&1

# ctr images pull registry.aliyuncs.com/google_containers/kube-apiserver:v1.22.2 >/dev/null 2>&1
# ctr images pull registry.aliyuncs.com/google_containers/kube-controller-manager:v1.22.2 >/dev/null 2>&1
# ctr images pull registry.aliyuncs.com/google_containers/kube-scheduler:v1.22.2 >/dev/null 2>&1
# ctr images pull registry.aliyuncs.com/google_containers/kube-proxy:v1.22.2 >/dev/null 2>&1
# ctr images pull registry.aliyuncs.com/google_containers/pause:3.5 >/dev/null 2>&1
# ctr images pull registry.aliyuncs.com/google_containers/etcd:3.5.0-0 >/dev/null 2>&1
# ctr -n k8s.io images pull docker.io/v5cn/coredns:v1.8.4 >/dev/null 2>&1
# ctr -n k8s.io images tag docker.io/v5cn/coredns:v1.8.4 registry.aliyuncs.com/google_containers/coredns:v1.8.4 >/dev/null 2>&1

# 曲线救国，拉取kubernetes所需镜像
#kubeadm config images list | grep -v 'coredns' | sed 's#k8s.gcr.io#ctr images pull registry.aliyuncs.com\/google_containers#g' > images.sh
# registry.aliyuncs.com/google_containers 仓库中没有coredns镜像，再次曲线救国拉取coredns镜像
# containerd环境下镜像存在namespace隔离，kubernetes的镜像在k8s.io namespace下，因此需要指定namespace
# 拉取到镜像后，将镜像标记为registry.aliyuncs.com/google_containers/coredns:v1.8.4 后面的 kubeadm init 指定了image-repository为registry.aliyuncs.com/google_containers
#cat >> images.sh<<EOF
#ctr -n k8s.io images pull docker.io/v5cn/coredns:v1.8.4
#ctr -n k8s.io images tag docker.io/v5cn/coredns:v1.8.4 registry.aliyuncs.com/google_containers/coredns:v1.8.4
#EOF
kubeadm config images list  | sed 's#k8s.gcr.io#ctr images pull registry.aliyuncs.com\/google_containers#g' > images.sh
chmod +x images.sh && ./images.sh

echo "[TASK 2] Initialize Kubernetes Cluster"
kubeadm init \
  --apiserver-advertise-address=192.168.56.100 \
  --control-plane-endpoint=kmaster.k8s.com \
  --kubernetes-version v1.22.0 \
  --image-repository registry.aliyuncs.com/google_containers \
  --pod-network-cidr=192.168.0.0/16 > /root/kubeinit.log

echo "[TASK 3] Deploy Calico network"
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.18/manifests/calico.yaml

echo "[TASK 4] Generate and save cluster join command to /joincluster.sh"
kubeadm token create --print-join-command > /root/joincluster.sh
