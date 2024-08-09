#!/bin/bash

# Docker Compose로 컨테이너를 백그라운드에서 실행
docker-compose up -d

# Elasticsearch의 health 상태를 확인하기 위해 반복문을 사용
echo "Elasticsearch 서버 상태를 확인 중입니다..."

while true; do
    # 서버 상태를 확인하는 HTTP 요청을 보내고, 상태 코드와 health 상태를 확인
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9200/_cluster/health?wait_for_status=yellow&timeout=50s)
    HEALTH=$(curl -s http://localhost:9200/_cluster/health | grep '"status":"green"')

    if [[ "$STATUS" -eq 200 && ! -z "$HEALTH" ]]; then
        echo "Elasticsearch 서버가 정상 상태입니다."
        break
    fi
    
    echo "Elasticsearch 서버가 아직 준비되지 않았습니다. 다시 시도 중..."
    sleep 5
done

# Elasticsearch 서버가 "healthy" 상태가 되면 index.sh 스크립트를 실행
echo "index.sh 스크립트를 실행합니다..."
./index.sh
