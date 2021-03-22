git pull

# 停止容器
/usr/local/bin/docker stop docker-webhooks || true

# 删除容器
/usr/local/bin/docker rm -f docker-webhooks &> /dev/null || true

# 创建镜像
/usr/local/bin/docker image build ./ -t docker-webhooks

# 启动容器
/usr/local/bin/docker run -d --restart=on-failure:5 -p 8084:80 --name docker-webhooks docker-webhooks
