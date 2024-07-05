# Dockerfile para C4 (Ubuntu 22.10 - S1)
FROM ubuntu:22.10

RUN apt-get update && \
    apt-get install -y openssh-server openssh-client

# Configurar usuario 'prueba' con contraseña 'prueba'
RUN useradd -m prueba && \
    echo "prueba:prueba" | chpasswd

# Permitir acceso SSH con contraseña (normalmente deshabilitado por defecto)
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
