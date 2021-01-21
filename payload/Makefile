PROJECT=payload
PROJECT_VERSION=v0.0.1

default: payload

payload:
	gcc payload.c -o payload

clean:
	-rm -f payload

package: payload
	docker build -t "$(PROJECT):$(PROJECT_VERSION)" ./
	docker tag "$(PROJECT):$(PROJECT_VERSION)" "$(PROJECT):latest"
