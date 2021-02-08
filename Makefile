.PHONY: inittf
inittf:
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
	sudo apt-add-repository "deb [arch=$(shell dpkg --print-architecture)] https://apt.releases.hashicorp.com $(shell lsb_release -cs) main"
	sudo apt update
	sudo apt install --upgrade terraform
	sudo rm /usr/local/bin/terraform
	sudo ln -s /usr/bin/terraform /usr/local/bin/terraform
	terraform -v

# https://stackoverflow.com/a/7367903
guard-%:
	@ if [ "${${*}}" = "" ]; then \
	    echo "Environment variable $* not set"; \
	    exit 1; \
	fi

.PHONY: initgit
initgit: guard-EMAIL
	git config --global user.name "Gavin Chun Jin"
	git config --global user.email ${EMAIL}
