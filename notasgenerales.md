# **NOTAS GENERALES**

- ### Crear un volumen 
```docker
docker volume create campuscloud-sql-data
```

- ### Crear un red
```docker
 docker network create campus-network
```
- ### exportar una imagen de Docker a un archivo comprimido
```docker
 docker save -o hello-word-v1.tar hello-world:latest
```
- ### importar de archivo comprimido a una imagen de Docker  
```docker
 docker load -i sqlserver2025.tar
```
- ### eliminar archivo en Linux
```docker
rm nombredelarchivo.tar
```


# Comandos para crear y cargar una 
