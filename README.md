## ✅ Requisitos previos

Antes de iniciar, asegúrate de tener instalados:

- **PHP >= 8.1**  
- **Composer** 
- **PostgreSQL 16** (Crear la base de datos previamente)  
- **Node.js** (Node.js (versión recomendada: 22.x))  

## 🔵 2. Clonar el repositorio

1. Abre la terminal o CMD.
2. Ubícate en la carpeta donde quieras clonar el proyecto.
3. Ejecuta:
```sh
git clone https://github.com/alejandroariasg/itbf-hoteles.git
```

# 📝  Manual de Despliegue Local Backend (Laravel)

Ingresa al directorio backend del proyecto:
```sh
cd hoteles-backend
```

## Instalar dependencias
Ejecuta el siguiente comando en la tereminal
```sh
composer install
```
## Configurar variables de entorno

#### Duplica el archivo .env.example y nómbralo .env
```sh
APP_NAME=Laravel
APP_ENV=local
APP_KEY=  # Se generará en el siguiente paso
APP_DEBUG=true
APP_URL=http://localhost:8000

DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=nombre_base_datos
DB_USERNAME=usuario
DB_PASSWORD=contraseña
```

## Generar APP_KEY
```sh
php artisan key:generate
```
## Ejecutar migraciones
```sh
php artisan migrate
```
## Iniciar el servidor local
```sh
php artisan serve
```
###  Abre en navegador
```sh
http://localhost:8000
```

## Posibles errores y soluciones
| Error                         | Solución                                   |
| ----------------------------- | ------------------------------------------ |
| `php: command not found`      | Instala PHP y asegúrate que esté en PATH   |
| `composer: command not found` | Instala Composer                           |
| `php artisan migrate` Problemas con base de datos   | Verifica conexión y credenciales en `.env` y  verifique tener la base de datos creada previamente|
| APP\_KEY missing              | Ejecuta `php artisan key:generate`         |

# 📝  Manual de Despliegue Local FrontEnd (React)
### Ingresa al directorio backend del proyecto:
```sh
cd hoteles-frontend
```

### Instalar dependencias
Ejecuta en la terminal el comando
```sh
npm install
```
### Configurar variables de entorno
En la ruta `hoteles-frontend\src\config` edita el archivo `api.jsx` 
Ajusta la URL al backend correspondiente del entorno local
```sh
API_URL=http://localhost:8000/api
```
###  Ejecutar el proyecto en modo desarrollo
Para iniciar el servidor local:
```sh
npm run dev
```
### Abre el navegador en
```sh
http://localhost:5173
```
