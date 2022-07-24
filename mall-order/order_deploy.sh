# 将jar文件、Dockerfile和这个sh文件一并传到二号服务器，执行该脚本
docker build -t mall-order:latest  --build-arg JAR_FILE=mall-order-1.0.jar  .
docker run -di -p 16004:16004 --name mall-order mall-order 
# docker login -u 1243134432@qq.com -p L200107208017. myteam-p-docker.pkg.coding.net
# docker push myteam-p-docker.pkg.coding.net/mall-project/mall/mall-order:1.0