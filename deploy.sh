git pull

# 停止容器
docker stop docker-webhooks || true

# 删除容器
docker rm -f docker-webhooks &> /dev/null || true

# 创建镜像
docker image build ./ -t docker-webhooks

# 启动容器
docker run -d --restart=on-failure:5 -p 8084:80 --name docker-webhooks docker-webhooks
