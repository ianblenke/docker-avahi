build:
	docker build -t ianblenke/avahi .

install:
	sudo coreos-cloudinit --from-file avahi.cloud-init
