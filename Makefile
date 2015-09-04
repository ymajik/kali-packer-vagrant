.PHONY: deps convert start stop clean image
.DEFAULT_GOAL := start

TEMPLATE_FILE := templates/kali.json

deps:
	@hash packer > /dev/null 2>&1 || (echo "Install packer to continue"; echo 1)
	@hash vagrant > /dev/null 2>&1 || (echo "Install vagrant to continue"; echo 1)
	@hash parallel > /dev/null 2>&1 || (echo "Install parallel to continue"; echo 1)
	@hash ruby > /dev/null 2>&1 || (echo "Install ruby to continue"; echo 1)

convert: deps
	@find templates -name '*.yml' -type f | parallel "ruby -r yaml -r json -e 'puts JSON.dump(YAML.load(ARGF.read))' < {} > {.}.json"

image: convert
	@packer build $(TEMPLATE_FILE)

start:
	@vagrant up

stop:
	@vagrant halt

validate: convert
	@packer inspect $(TEMPLATE_FILE)

clean: deps
	@vagrant destroy -f

