SHELL			:=	/bin/bash

.PHONY: help install

.DEFAULT_GOAL := help

define install_command_line_tools
	xcode_select_path=$$(xcode-select --print-path); \
	if [[ ! -d "$$xcode_select_path" ]]; then \
		xcode-select --install; \
	fi
endef

define install_brew
	if [[ ! -f "/usr/local/bin/brew" ]]; then \
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; \
	fi
endef

define install_ansible
	brew install python@3.9 ansible
endef

define install_ansible_dependencies
	ansible-galaxy install -r requirements.yml
endef

define install
	ansible-playbook --ask-become-pass -i local.hosts playbook.yml
endef

help: ## show help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

init: ## Init before install
	@$(call install_command_line_tools)
	@$(call install_brew)
	@$(call install_ansible)
	@$(call install_ansible_dependencies)

install: init ## build zip file
	@$(call install)
