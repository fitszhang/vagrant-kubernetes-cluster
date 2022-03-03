# vagrant-kubernetes-cluster

**_Vagrant一键安装Kubernetes集群。安装 Metrics Server 、Kuboard 、Kubernetes Dashboard、KubePi、Kubernetes集群监控prometheus-operator等。_**

**安装环境**：

- Vagrant 版本： 2.2.18
- VirtualBox 版本： 6.1.26

虚拟机网卡设置如图所示：

![image-20211012134939433](Screenshots/image-20211012134939433.png)

**CentOS7 环境安装版本**：

- Ubuntu 版本： centos7
- Containerd 版本： 1.4.11
- Kubernetes 版本： v1.22.2

**Ubuntu 环境安装版本**：

- Ubuntu 版本： 20.04.2 LTS
- Containerd 版本： 1.5.5
- Kubernetes 版本： v1.22.0

## 一键安装

```bash
vagrant up

Bringing machine 'kmaster' up with 'virtualbox' provider...
Bringing machine 'kworker1' up with 'virtualbox' provider...
Bringing machine 'kworker2' up with 'virtualbox' provider...
==> kmaster: Importing base box 'generic/ubuntu2004'...
==> kmaster: Matching MAC address for NAT networking...
==> kmaster: Setting the name of the VM: kmaster
==> kmaster: Clearing any previously set network interfaces...
==> kmaster: Preparing network interfaces based on configuration...
    kmaster: Adapter 1: nat
    kmaster: Adapter 2: hostonly
==> kmaster: Forwarding ports...
    kmaster: 22 (guest) => 2222 (host) (adapter 1)
==> kmaster: Running 'pre-boot' VM customizations...
==> kmaster: Booting VM...
==> kmaster: Waiting for machine to boot. This may take a few minutes...
    kmaster: SSH address: 127.0.0.1:2222
    kmaster: SSH username: vagrant
    kmaster: SSH auth method: private key
    kmaster:
    kmaster: Vagrant insecure key detected. Vagrant will automatically replace
    kmaster: this with a newly generated keypair for better security.
    kmaster:
    kmaster: Inserting generated public key within guest...
    kmaster: Removing insecure key from the guest if it's present...
    kmaster: Key inserted! Disconnecting and reconnecting using new SSH key...
==> kmaster: Machine booted and ready!
==> kmaster: Checking for guest additions in VM...
==> kmaster: Setting hostname...
==> kmaster: Configuring and enabling network interfaces...
==> kmaster: Mounting shared folders...
    kmaster: /vagrant => D:/Vagrant/kubernetes-cluster
==> kmaster: Running provisioner: shell...
    kmaster: Running: C:/Users/swfeng/AppData/Local/Temp/vagrant-shell20211012-49908-1qfj4jz.sh
    kmaster: [TASK 0] Setting TimeZone
    kmaster: [TASK 1] Setting DNS
    kmaster: [TASK 2] Setting Ubuntu System Mirrors
    kmaster: [TASK 3] Disable and turn off SWAP
    kmaster: [TASK 4] Stop and Disable firewall
    kmaster: [TASK 5] Enable and Load Kernel modules
    kmaster: [TASK 6] Add Kernel settings
    kmaster: [TASK 7] Install containerd runtime
    kmaster: [TASK 8] Add apt repo for kubernetes
    kmaster: Warning: apt-key output should not be parsed (stdout is not a terminal)
    kmaster: OK
    kmaster: [TASK 9] Install Kubernetes components (kubeadm, kubelet and kubectl)
    kmaster: [TASK 10] Enable ssh password authentication
    kmaster: [TASK 11] Set root password
    kmaster: [TASK 12] Update /etc/hosts file
==> kmaster: Running provisioner: shell...
    kmaster: Running: C:/Users/swfeng/AppData/Local/Temp/vagrant-shell20211012-49908-11nj6h4.sh
    kmaster: [TASK 1] Pull required containers
    kmaster: [TASK 2] Initialize Kubernetes Cluster
    kmaster: [TASK 3] Deploy Calico network
    kmaster: [TASK 4] Generate and save cluster join command to /joincluster.sh
==> kworker1: Importing base box 'generic/ubuntu2004'...
==> kworker1: Matching MAC address for NAT networking...
==> kworker1: Setting the name of the VM: kworker1
==> kworker1: Fixed port collision for 22 => 2222. Now on port 2200.
==> kworker1: Clearing any previously set network interfaces...
==> kworker1: Preparing network interfaces based on configuration...
    kworker1: Adapter 1: nat
    kworker1: Adapter 2: hostonly
==> kworker1: Forwarding ports...
    kworker1: 22 (guest) => 2200 (host) (adapter 1)
==> kworker1: Running 'pre-boot' VM customizations...
==> kworker1: Booting VM...
==> kworker1: Waiting for machine to boot. This may take a few minutes...
    kworker1: SSH address: 127.0.0.1:2200
    kworker1: SSH username: vagrant
    kworker1: SSH auth method: private key
    kworker1:
    kworker1: Vagrant insecure key detected. Vagrant will automatically replace
    kworker1: this with a newly generated keypair for better security.
    kworker1:
    kworker1: Inserting generated public key within guest...
    kworker1: Removing insecure key from the guest if it's present...
    kworker1: Key inserted! Disconnecting and reconnecting using new SSH key...
==> kworker1: Machine booted and ready!
==> kworker1: Checking for guest additions in VM...
==> kworker1: Setting hostname...
==> kworker1: Configuring and enabling network interfaces...
==> kworker1: Mounting shared folders...
    kworker1: /vagrant => D:/Vagrant/kubernetes-cluster
==> kworker1: Running provisioner: shell...
    kworker1: Running: C:/Users/swfeng/AppData/Local/Temp/vagrant-shell20211012-49908-6qmkd4.sh
    kworker1: [TASK 0] Setting TimeZone
    kworker1: [TASK 1] Setting DNS
    kworker1: [TASK 2] Setting Ubuntu System Mirrors
    kworker1: [TASK 3] Disable and turn off SWAP
    kworker1: [TASK 4] Stop and Disable firewall
    kworker1: [TASK 5] Enable and Load Kernel modules
    kworker1: [TASK 6] Add Kernel settings
    kworker1: [TASK 7] Install containerd runtime
    kworker1: [TASK 8] Add apt repo for kubernetes
    kworker1: Warning: apt-key output should not be parsed (stdout is not a terminal)
    kworker1: OK
    kworker1: [TASK 9] Install Kubernetes components (kubeadm, kubelet and kubectl)
    kworker1: [TASK 10] Enable ssh password authentication
    kworker1: [TASK 11] Set root password
    kworker1: [TASK 12] Update /etc/hosts file
==> kworker1: Running provisioner: shell...
    kworker1: Running: C:/Users/swfeng/AppData/Local/Temp/vagrant-shell20211012-49908-vmdbxa.sh
    kworker1: [TASK 1] Join node to Kubernetes Cluster
==> kworker2: Importing base box 'generic/ubuntu2004'...
==> kworker2: Matching MAC address for NAT networking...
==> kworker2: Setting the name of the VM: kworker2
==> kworker2: Fixed port collision for 22 => 2222. Now on port 2201.
==> kworker2: Clearing any previously set network interfaces...
==> kworker2: Preparing network interfaces based on configuration...
    kworker2: Adapter 1: nat
    kworker2: Adapter 2: hostonly
==> kworker2: Forwarding ports...
    kworker2: 22 (guest) => 2201 (host) (adapter 1)
==> kworker2: Running 'pre-boot' VM customizations...
==> kworker2: Booting VM...
==> kworker2: Waiting for machine to boot. This may take a few minutes...
    kworker2: SSH address: 127.0.0.1:2201
    kworker2: SSH username: vagrant
    kworker2: SSH auth method: private key
    kworker2:
    kworker2: Vagrant insecure key detected. Vagrant will automatically replace
    kworker2: this with a newly generated keypair for better security.
    kworker2:
    kworker2: Inserting generated public key within guest...
    kworker2: Removing insecure key from the guest if it's present...
    kworker2: Key inserted! Disconnecting and reconnecting using new SSH key...
==> kworker2: Machine booted and ready!
==> kworker2: Checking for guest additions in VM...
==> kworker2: Setting hostname...
==> kworker2: Configuring and enabling network interfaces...
==> kworker2: Mounting shared folders...
    kworker2: /vagrant => D:/Vagrant/kubernetes-cluster
==> kworker2: Running provisioner: shell...
    kworker2: Running: C:/Users/swfeng/AppData/Local/Temp/vagrant-shell20211012-49908-1s6ys4c.sh
    kworker2: [TASK 0] Setting TimeZone
    kworker2: [TASK 1] Setting DNS
    kworker2: [TASK 2] Setting Ubuntu System Mirrors
    kworker2: [TASK 3] Disable and turn off SWAP
    kworker2: [TASK 4] Stop and Disable firewall
    kworker2: [TASK 5] Enable and Load Kernel modules
    kworker2: [TASK 6] Add Kernel settings
    kworker2: [TASK 7] Install containerd runtime
    kworker2: [TASK 8] Add apt repo for kubernetes
    kworker2: Warning: apt-key output should not be parsed (stdout is not a terminal)
    kworker2: OK
    kworker2: [TASK 9] Install Kubernetes components (kubeadm, kubelet and kubectl)
    kworker2: [TASK 10] Enable ssh password authentication
    kworker2: [TASK 11] Set root password
    kworker2: [TASK 12] Update /etc/hosts file
==> kworker2: Running provisioner: shell...
    kworker2: Running: C:/Users/swfeng/AppData/Local/Temp/vagrant-shell20211012-49908-1qxwo1n.sh
    kworker2: [TASK 1] Join node to Kubernetes Cluster
```

> 安装后三台机器的 IP 为：

|  机器名  |       IP       |
| :------: | :------------: |
| kmaster  | 192.168.56.100 |
| kworker1 | 192.168.56.101 |
| kworker2 | 192.168.56.102 |

> `root`用户密码为`kubeadmin`


## 登录到kmaster
root@kmaster:~# ssh kworker1
root@kmaster:~# scp kmaster.k8s.com:/root/joincluster.sh /root/joincluster.sh
root@kmaster:~# bash /root/joincluster.sh
root@kmaster:~# exit
root@kmaster:~# ssh kworker2
root@kmaster:~# scp kmaster.k8s.com:/root/joincluster.sh /root/joincluster.sh
root@kmaster:~# bash /root/joincluster.sh
root@kmaster:~# exit

## 配置.kube/config

```bash
root@kmaster:~# mkdir -p $HOME/.kube
root@kmaster:~# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
root@kmaster:~# sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

集群状态：

```bash
root@kmaster:~# kubectl cluster-info
Kubernetes control plane is running at https://kmaster.k8s.com:6443
CoreDNS is running at https://kmaster.k8s.com:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```

```bash
root@kmaster:~# kubectl get node,po,svc -A -owide

Every 2.0s: kubectl get node,po,svc -A -owide                                                                                                             kmaster: Tue Oct 12 13:53:57 2021

NAME            STATUS   ROLES                  AGE     VERSION   INTERNAL-IP      EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION     CONTAINER-RUNTIME
node/kmaster    Ready    control-plane,master   20m     v1.22.0   192.168.56.100   <none>        Ubuntu 20.04.2 LTS   5.4.0-77-generic   containerd://1.5.5
node/kworker1   Ready    <none>                 9m40s   v1.22.0   192.168.56.101   <none>        Ubuntu 20.04.2 LTS   5.4.0-77-generic   containerd://1.5.5
node/kworker2   Ready    <none>                 7m35s   v1.22.0   192.168.56.102   <none>        Ubuntu 20.04.2 LTS   5.4.0-77-generic   containerd://1.5.5

NAMESPACE     NAME                                           READY   STATUS    RESTARTS   AGE     IP               NODE       NOMINATED NODE   READINESS GATES
kube-system   pod/calico-kube-controllers-7659fb8886-dwvc4   1/1     Running   0          20m     192.168.189.2    kmaster    <none>           <none>
kube-system   pod/calico-node-2w8x5                          1/1     Running   0          20m     192.168.56.100   kmaster    <none>           <none>
kube-system   pod/calico-node-vqjsc                          1/1     Running   0          7m35s   192.168.56.102   kworker2   <none>           <none>
kube-system   pod/calico-node-zj98h                          1/1     Running   0          9m40s   192.168.56.101   kworker1   <none>           <none>
kube-system   pod/coredns-7568f67dbd-4jssz                   1/1     Running   0          20m     192.168.189.3    kmaster    <none>           <none>
kube-system   pod/coredns-7568f67dbd-vn8ph                   1/1     Running   0          20m     192.168.189.1    kmaster    <none>           <none>
kube-system   pod/etcd-kmaster                               1/1     Running   0          20m     192.168.56.100   kmaster    <none>           <none>
kube-system   pod/kube-apiserver-kmaster                     1/1     Running   0          20m     192.168.56.100   kmaster    <none>           <none>
kube-system   pod/kube-controller-manager-kmaster            1/1     Running   0          20m     192.168.56.100   kmaster    <none>           <none>
kube-system   pod/kube-proxy-2sqmm                           1/1     Running   0          7m35s   192.168.56.102   kworker2   <none>           <none>
kube-system   pod/kube-proxy-8z758                           1/1     Running   0          20m     192.168.56.100   kmaster    <none>           <none>
kube-system   pod/kube-proxy-brgl8                           1/1     Running   0          9m40s   192.168.56.101   kworker1   <none>           <none>
kube-system   pod/kube-scheduler-kmaster                     1/1     Running   0          20m     192.168.56.100   kmaster    <none>           <none>

NAMESPACE     NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)                  AGE   SELECTOR
default       service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP                  20m   <none>
kube-system   service/kube-dns     ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP,9153/TCP   20m   k8s-app=kube-dns
```

## 安装 metrics-server

```bash
root@kmaster:/vagrant/metrics# kubectl apply -f metrics.yaml
serviceaccount/metrics-server created
clusterrole.rbac.authorization.k8s.io/system:aggregated-metrics-reader created
clusterrole.rbac.authorization.k8s.io/system:metrics-server created
rolebinding.rbac.authorization.k8s.io/metrics-server-auth-reader created
clusterrolebinding.rbac.authorization.k8s.io/metrics-server:system:auth-delegator created
clusterrolebinding.rbac.authorization.k8s.io/system:metrics-server created
service/metrics-server created
deployment.apps/metrics-server created
apiservice.apiregistration.k8s.io/v1beta1.metrics.k8s.io created
```

