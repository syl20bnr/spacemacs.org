# ============================================================================
#            S P A C E M A C S     W E B S I T E  &  S E R V E R
# ============================================================================

SHELL:=/bin/bash
OPS_DIR:=ops
ifdef V
	ANSIBLE_VERBOSE:=-$(V)
endif

devserver_up:
	@echo "Starting Web Server VM..."
	@cd $(OPS_DIR); vagrant up

devserver_ssh:
	@echo "Starting SSH session with Web Server VM..."
	@cd $(OPS_DIR); vagrant ssh default

devserver_down:
	@echo "Shutting down Web Server VM..."
	@cd $(OPS_DIR); vagrant halt

devserver_new:
	@echo "Destroying VM and restarting a brand new one..."
	@cd $(OPS_DIR); vagrant destroy -f default; vagrant up

devserver_install: ansible_roles
	@echo "Installing dev server..."
	@cd $(OPS_DIR); \
  ansible-playbook playbooks/install.yml -i dev.inventory $(ANSIBLE_VERBOSE)

devserver_deploy: ansible_roles
	@echo "Deploying new version to dev server..."
	@cd $(OPS_DIR); \
  ansible-playbook playbooks/deploy.yml -i dev.inventory $(ANSIBLE_VERBOSE)

ansible_roles:
	@echo "Fetching roles from ansible galaxy..."
	@cd $(OPS_DIR); ansible-galaxy install -r requirements.yml -p .ansible/roles

.PHONY: devserver_ssh devserver_up devserver_down devserver_rebuild \
        devserver_install devserver_deploy \
        ansible_roles
