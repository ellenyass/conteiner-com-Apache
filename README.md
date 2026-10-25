# Site em Container Docker

Site HTML simples empacotado em `.tar` e servido por Apache em um container **Debian trixie**.

## Estrutura

```
meu_projeto/
  ├── Dockerfile
  ├── meu_site.tar
  ├── README.md
  └── site/          # fontes do site (antes de compactar)
      ├── index.html
      └── style.css
```

## Como gerar o `.tar` (a partir da pasta do site)

No PowerShell / Git Bash / WSL, dentro de `meu_projeto`:

```bash
tar -czf meu_site.tar -C site index.html style.css
```

## Build e execução

```bash
docker build -t meu-site .
docker run -d --name meu-site-container -p 8080:80 meu-site
```

Acesse: http://localhost:8080

## Comandos úteis (evidências)

```bash
docker images
docker ps
docker logs meu-site-container
```

Para parar e remover:

```bash
docker stop meu-site-container
docker rm meu-site-container
```
