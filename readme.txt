# 1. 创建自定义网络
docker network create --subnet=192.168.100.0/24 my-custom-network

# 2. 解压 sqldockerfile.tar
tar -xvf sqldockerfile.tar

# 3. 构建数据库镜像
docker build -t my-database-app -f Dockerfile_database .

# 4. 启动数据库容器（固定 IP 为 192.168.100.3）
docker run -d \
  --name my-mysql-container \
  --net my-custom-network \
  --ip 192.168.100.3 \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=hospital \
  my-database-app

# 5. 构建 web 容器镜像
docker build -t my-tomcat-app -f Dockerfile_web .

# 6. 启动 web 容器
docker run -d \
  --name my-tomcat-container \
  --net my-custom-network \
  -p 8080:8080 \
  my-tomcat-app

# 7. 验证容器运行状态
docker ps

http://localhost:8080/