all: build

build:
	docker build -t elct9620/gitlab-sonar-scanner .

run:
	docker run --name sonar-scanner elct9620/gitlab-sonar-scanner

clean:
	@docker rm sonar-scanner
	docker rmi sonar-scanner
