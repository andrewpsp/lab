export DOCKER_IMAGE ?= entercloud/$(APP)
export DOCKER_TAG ?= dev
export DOCKER_IMAGE_NAME ?= $(DOCKER_IMAGE):$(DOCKER_TAG)
export DOCKER_BUILD_FLAGS = 

reset:
	ssh-keygen -R '[localhost]:1234' || true

shell: reset
	docker run --name bastion --rm -it -p1234:22 \
		-v ~/.ssh/:/root/.ssh/ \
		--env-file=../.secrets \
		--env-file=../.duo \
		-e MFA_PROVIDER=google-authenticator \
		-e SLACK_ENABLED=true \
		--entrypoint=/bin/bash $(DOCKER_IMAGE_NAME)

run: reset
	docker run --name bastion --rm -it -p1234:22 \
		-v ~/.ssh/:/root/.ssh/ \
		--env-file=../.secrets \
		--env-file=../.duo \
		-e MFA_PROVIDER=google-authenticator \
		-e SLACK_ENABLED=true \
			$(DOCKER_IMAGE_NAME)
