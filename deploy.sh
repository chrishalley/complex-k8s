docker build -t chrishalley86/multi-client:latest -t chrishalley86/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t chrishalley86/multi-server:latest -t chrishalley86/multi-server:$SHA  -f ./server/Dockerfile ./server
docker build -t chrishalley86/multi-worker:latest -t chrishalley86/multi-worker:$SHA  -f ./worker/Dockerfile ./worker

docker push chrishalley86/multi-client:latest
docker push chrishalley86/multi-server:latest
docker push chrishalley86/multi-worker:latest

docker push chrishalley86/multi-client:$SHA
docker push chrishalley86/multi-server:$SHA
docker push chrishalley86/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=chrishalley86/multi-server:$SHA
kubectl set image deployments/client-deployment client=chrishalley86/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=chrishalley86/multi-worker:$SHA