# IaC - Terraform + Ansible para Deploy de Ambiente Django na AWS

Este projeto demonstra a criação de uma infraestrutura automatizada com **Terraform** e **Ansible**, provisionando uma instância EC2 na AWS e configurando um ambiente Python com Django e Django REST Framework.

---

## 🚀 Tecnologias Utilizadas

- 🔧 **Terraform** – Provisão de infraestrutura como código
- ⚙️ **Ansible** – Configuração automatizada da instância EC2
- ☁️ **AWS EC2** – Infraestrutura de nuvem
- 🐍 **Python 3**, **virtualenv**, **Django**, **Django REST Framework**
- 🐧 **Ubuntu Server** – Sistema operacional da instância

---

## 📁 Estrutura do Projeto

iac-terraform-ansible/
├── hosts.yml # Inventário Ansible no formato YAML
├── playbook.yml # Playbook principal para configuração da EC2
├── .gitignore # Ignora a chave privada (.pem)
└── iac-git.pem # Chave privada da AWS (NÃO DEVE SER VERSIONADA)


---

## ⚙️ Como Usar

### 📌 Pré-requisitos

- Conta na AWS com acesso à criação de EC2
- Terraform e Ansible instalados na máquina local
- Chave privada `.pem` da AWS (deve ser mantida fora do Git)

---

### 1. Provisione a infraestrutura com Terraform

```bash
terraform init
terraform apply

O Terraform criará uma instância EC2 e exibirá o IP público ao final.

2. Atualize o inventário hosts.yml
Edite o IP no arquivo hosts.yml para refletir o IP público da EC2:

yaml
Copiar
Editar
all:
  children:
    terraform_ansible:
      hosts:
        SEU.IP.PUBLICO:
          ansible_user: ubuntu
          ansible_ssh_private_key_file: iac-git.pem

3. Execute o Ansible Playbook
bash
Copiar
Editar
ansible-playbook playbook.yml -i hosts.yml

O Ansible irá:

Instalar Python, pip e virtualenv

Criar o diretório /home/ubuntu/tcc

Criar o ambiente virtual venv

Instalar Django e Django REST Framework com pip

Iniciar um projeto Django no diretório

 O que será configurado
Após a execução do playbook, a instância EC2 estará com:

Ambiente Python 3

Virtualenv ativado

Django e Django REST instalados

Projeto Django iniciado em /home/ubuntu/tcc/setup

🛡️ Segurança
⚠️ IMPORTANTE: Nunca suba a sua chave .pem para o repositório!

Se isso acontecer:

bash
Copiar
Editar
git rm --cached iac-git.pem
echo "iac-git.pem" >> .gitignore
git commit -m "Removendo chave privada do repositório"
git push

👤 Autor
Feito com 💻 por Lucas Aguiar

📜 Licença
Este projeto está sob a licença MIT. Sinta-se livre para usar e adaptar!
