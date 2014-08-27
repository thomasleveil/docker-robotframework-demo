IMAGE=tomdesinto/robotframework-demo
CONTAINER=robotframework-demo
VOLUMES=-v $$(pwd)/reports:/reports

build:
	docker build --rm --tag "$(IMAGE)" .

clean:
	docker rm -f $(CONTAINER) 2>/dev/null |:
	
run: clean
	docker run $(VOLUMES) --name $(CONTAINER) "$(IMAGE)" |:
	
logs:
	docker logs -f $(CONTAINER)

shell:
	docker run --rm --tty --interactive $(VOLUMES) "$(IMAGE)" bash -il