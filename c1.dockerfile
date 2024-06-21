# Utiliza la imagen base de Ubuntu 16.10
FROM ubuntu:16.10

# Actualiza el índice de paquetes e instala el cliente OpenSSH

# Establece la variable de entorno LANG
ENV LANG C.UTF-8

# Inicia el servicio ssh para permitir conexiones SSH
CMD ["bash"]
