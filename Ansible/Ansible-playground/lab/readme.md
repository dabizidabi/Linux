```
ansible -i hosts proxy -m setup #gather facts about the hosts in the inventory
ansible-playbook -i hosts -K playbook1.yml
ansible-playbook -i hosts -K playbook1.yml --tags=docker
ansible-galaxy init myrole #create an Ansible role
```
