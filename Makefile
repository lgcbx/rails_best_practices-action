image := lgcbx/rails_best_practices-action
version := 1.20.0
tagged_image := ${image}:v${version}
progress := auto

.SILENT: build

build:
	@echo "Building $(tagged_image)"
	docker build \
		--build-arg BUILDKIT_INLINE_CACHE=1 \
		--build-arg VERSION=$(version) \
		--cache-from $(tagged_image) \
		--tag $(tagged_image) \
		--progress $(progress) \
		.

push:
	@echo "Pushing $(tagged_image)"
	docker push $(tagged_image)

release: build push
