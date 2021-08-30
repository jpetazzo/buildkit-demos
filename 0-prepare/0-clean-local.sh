docker ps -aq | xargs docker rm -f
docker system prune -f
