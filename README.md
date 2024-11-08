# Practica-iaw-1.5
Repositorio para la práctica 1.5. de IAW

# 1 Instalar y configurar el cliente ACME Certbot en la instancia EC2 de AWS.

## 1.1 Realizamos la instalación y actualización de snapd.
```
sudo snap install core
sudo snap refresh core
```

## 1.2 Eliminamos si existiese alguna instalación previa de certbot con apt.
```
sudo apt remove certbot -y
```

## 1.3 Instalamos el cliente de Certbot con snapd.
```
sudo snap install --classic certbot
```

También es posible especificar como argumentos las respuestas que nos hará certbot durante el proceso de instalación. Por ejemplo, las mismas respuestas que hemos dado durante la instalación manual se podrían haber indicado con los siguientes parámetros.

* Dirección de correo: `-m $LE_EMAIL`
* Aceptamos los términos de uso: `--agree-tos`
* No queremos compartir nuestro email con la Electronic Frontier Foundation: `--no-eff-email`
* Dominio: `-d $LE_DOMAIN`
Además, vamos a añadir el parámetro `--non-interactive` para que al ejecutar el comando no solicite al usuario ningún dato por teclado. Esta opción es útil cuando queremos automatizar la instalación de Certbot mediante un script.

```
certbot --apache -m $LE_EMAIL --agree-tos --no-eff-email -d $LE_DOMAIN --non-interactive
```

La dirección de correo y el dominio estarán en el archivo `.env` donde las declararemos con sus respectivos datos, de esta manera:

![](/img/Screenshot_20241108_132047.png)

## 1.4 Creamos una alias para el comando certbot.
```
sudo ln -fs /snap/bin/certbot /usr/bin/certbot
```

Y este sería el resultado:
![](/img/Screenshot_20241108_132231.png)
