# Imagem base Debian (trixie)
FROM debian:trixie

# Evita prompts interativos na instalação de pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Instala o servidor web Apache
RUN apt-get update && \
    apt-get install -y --no-install-recommends apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copia o site compactado e extrai no DocumentRoot do Apache
COPY meu_site.tar /tmp/meu_site.tar
RUN tar -xzf /tmp/meu_site.tar -C /var/www/html && \
    rm /tmp/meu_site.tar

# Porta HTTP do Apache
EXPOSE 80

# Apache em primeiro plano (necessário dentro do container)
CMD ["apachectl", "-D", "FOREGROUND"]
