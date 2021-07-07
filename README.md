推荐更换为富容器方案

#创建容器
docker run -d --restart unless-stopped --name centos8 --privileged=true --network host -v /data/www:/www -v /tmp:/tmp centos:8 /usr/sbin/init

#备份容器
docker export centos8 -o centos8.tar

#恢复容器为镜像
docker import centos8.tar centos8
