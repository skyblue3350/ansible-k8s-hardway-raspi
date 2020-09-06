USERNAME=pi
PASSWORD=raspberry
PUB_KEY=~/.ssh/id_rsa.pub

ssh-copy-id:
ifndef TARGET
	$(error TARGET is not set)
endif
	ssh-copy-id -i ${PUB_KEY} ${USERNAME}@${TARGET}

ping:
	ansible -i ${INVENTORY} ${TARGET} -m ping --user ${USERNAME}

setup-user:
	ansible-playbook -i ${INVENTORY} -l ${TARGET} setup_create_user.yaml --user ${USERNAME} -e "admin_user=${USER}"
	ansible-playbook -i ${INVENTORY} -l ${TARGET} setup_remove_user.yaml --user ${USER} -e "remove_user=${USERNAME}"