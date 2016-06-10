all: build

build:
	docker build -t sonar-scanner .

run:
	docker run --name sonar-scanner sonar-scanner

clean:
	@docker rm sonar-scanner
	docker rmi sonar-scanner
