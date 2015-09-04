.PHONY: deps convert start stop clean image validate
.DEFAULT_GOAL := start

TEMPLATE_FILE := templates/kali.json
PACKER_BIN := packer
VAGRANT_BIN := vagrant
RUBY_BIN := ruby
PARALLEL_BIN := parallel

deps:
	@hash $(PACKER_BIN) > /dev/null 2>&1 || (echo "Install packer to continue"; echo 1)
	@hash $(VAGRANT_BIN) > /dev/null 2>&1 || (echo "Install vagrant to continue"; echo 1)
	@hash $(PARALLEL_BIN) > /dev/null 2>&1 || (echo "Install parallel to continue"; echo 1)
	@hash $(RUBY_BIN) > /dev/null 2>&1 || (echo "Install ruby to continue"; echo 1)

convert: deps
	@find templates -name '*.yml' -type f | $(PARALLEL_BIN) "$(RUBY_BIN) -r yaml -r json -e 'puts JSON.dump(YAML.load(ARGF.read))' < {} > {.}.json"

image: convert
	@$(PACKER_BIN) build $(TEMPLATE_FILE)

start:
	@$(VAGRANT_BIN) up

stop:
	@$(VAGRANT_BIN) halt

validate: convert
	@$(PACKER_BIN) inspect $(TEMPLATE_FILE)

clean: deps
	@$(VAGRANT_BIN) destroy -f

