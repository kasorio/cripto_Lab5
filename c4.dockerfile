# Utiliza la imagen base de Ubuntu 22.04
FROM ubuntu:22.04

# Actualiza el índice de paquetes e instala el servidor SSH y otros paquetes necesarios
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Establece la variable de entorno LANG
ENV LANG C.UTF-8

# Configura el usuario y la contraseña
RUN useradd -rm -d /home/prueba -s /bin/bash -g root -G sudo -u 1000 prueba && \
    echo 'prueba:prueba' | chpasswd

# Configura SSH
RUN mkdir /var/run/sshd

# Configura el acceso SSH
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
