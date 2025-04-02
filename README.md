# 🚀 Automatizador de Commits em Repositórios Git

Este simples script foi criado para quem precisa atualizar repositórios Git com frequência. Ele busca automaticamente e lista todos os repositórios `.git` dentro de uma pasta específica (ou até mesmo no computador inteiro). Além disso, verifica se há modificações pendentes para commit.

---

## 📸 Demonstração

![Demonstração do script](img_script1)

O script permite escolher qual repositório deseja atualizar e inserir uma mensagem de commit de forma rápida e prática.

---

## 🎯 Como Usar

### 1️⃣ Baixando o Script

Para utilizá-lo no Linux, baixe o arquivo do repositório:

🔗 [Download do Script](https://github.com/hertonnn/scripts-utils/blob/114da46def84d00704cb28ee7ab023338f029416/update_github.sh)

Em seguida, modifique a variável `repository_current` no código para otimizar a busca dentro de uma pasta específica (por exemplo, a pasta `Documents`).

```shell
...
function menu(){
    clear
    echo " "
    repository_current="/home/Documents"  # Altere para o caminho desejado
    name_file=".git"
...
```

---

### 2️⃣ Criando um Comando Personalizado

No Linux, podemos criar um atalho para facilitar a execução do script diretamente pelo terminal.

Para mais informações sobre aliases no Bash, veja este artigo: [Criando Comandos Personalizados no Terminal Linux](https://diolinux.com.br/sistemas-operacionais/criando-comandos-personalizados-do-terminal-linux.html).

#### Passo a passo:

1️⃣ Abra o arquivo `.bashrc`:

```bash
  gedit ~/.bashrc
```

2️⃣ Adicione a seguinte linha ao final do arquivo (modificando o caminho conforme necessário):

```bash
  alias updateGIT="bash /home/Documents/update_github.sh"
```

3️⃣ Salve e feche o arquivo, depois recarregue as configurações do Bash:

```bash
  source ~/.bashrc
```

Agora, você pode usar o comando personalizado diretamente no terminal:

```bash
  updateGIT
```

---

## 🎉 Contribuição
Se quiser contribuir para melhorar esse script, sinta-se à vontade para fazer um fork e enviar pull requests!

📌 **Autor:** [hertonnn](https://github.com/hertonnn)

🔧 **Licença:** MIT


