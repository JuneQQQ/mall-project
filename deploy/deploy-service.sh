#! /bin/sh
repository=${repository}
module_name=${module_name}
version=${version}
port=${port}
project_name=${project_name}

imageName=$repository/$project_name/$module_name:$version

echo "$imageName"

#查询容器是否存在，存在则删除
containerId=`docker ps -a | grep -w ${module_name}:${version}  | awk '{print $1}'`
echo "docker ps -a | grep -w ${module_name}:${version}  | awk '{print $1}'"

if [ "$containerId" !=  "" ] ; then
    #停掉容器
    echo "=======容器ID:$containerId"
    docker stop $containerId

    #删除容器
    docker rm $containerId

	echo "=======容器已存在，成功删除容器"
fi

#查询镜像是否存在，存在则删除
imageId=`docker images | grep -w $module_name  | awk '{print $3}'`

if [ "$imageId" !=  "" ] ; then

    #删除镜像
    docker rmi -f $imageId

	echo "=======成功删除镜像"
fi


# 登录Harbor
docker login -u 1243134432@qq.com -p L200107208017. myteam-p-docker.pkg.coding.net

# 下载镜像
docker pull $imageName

docker tag $imageName ${module_name}

# 启动容器
docker run -di -p $port:$port --name ${module_name} ${module_name}

echo "容器启动成功"

