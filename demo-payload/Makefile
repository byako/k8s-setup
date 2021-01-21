PROJECT=demo-payload
PROJECT_VERSION=v0.0.1
SOURCES=demo-payload.c

default: build

build:
	gcc $(SOURCES) -o $(PROJECT)

clean:
	-rm -f $(PROJECT)

package: payload
	docker build -t "$(PROJECT):$(PROJECT_VERSION)" ./
	docker tag "$(PROJECT):$(PROJECT_VERSION)" "$(PROJECT):latest"
