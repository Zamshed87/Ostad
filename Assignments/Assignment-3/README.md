## Prerequisites
- Node Version 22
- Docker
- Docker Compose

### Output
```bash
<<<<<<< HEAD
=======

# Docker Deployment
docker-compose up -d --build              # Build and run containers

>>>>>>> 5aa12467b2bdafd0b13669e31a973030ad2373c9
# Application Endpoints
http://localhost:3000/        # Hello World (direct)
http://localhost:3000/api     # JSON API (direct)
http://localhost:8080/        # Hello World (via Nginx)
http://localhost:8080/api     # JSON API (via Nginx)

# Docker Hub Reference
Image: zamshed/assignment-3-express-app
URL: https://hub.docker.com/r/zamshed/assignment-3-express-app
<<<<<<< HEAD
```
### Dockerfile
```bash
cat > Dockerfile << 'EOF'
FROM node:22

# Set working directory inside container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Install pm2 globally to run the app
RUN npm install pm2 -g

# Copy the rest of the app source code
COPY . .

# Expose port 3000 (the app's port)
EXPOSE 3000

# Start the app using pm2-runtime (production-friendly)
CMD ["pm2-runtime", "src/server.js", "--name", "node-app"]
EOF

```
### docker-compose.yaml
```bash
cat > docker-compose.yml << 'EOF'
version: "3.9"

services:
  express-app:
    image: zamshed/assignment-3-express-app:latest
    container_name: express-app
    networks:
      - app-network
    ports:
      - "3000:3000"

  nginx:
    image: nginx:latest
    container_name: nginx
    depends_on:
      - express-app
    ports:
      - "8080:80"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
    networks:
      - app-network

networks:
  app-network:
    driver: bridge
EOF

```
### nginx.conf
```bash
cat > nginx.conf << 'EOF'
events {}

http {
    upstream express_app {
        server express-app:3000;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://express_app;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
        }
    }
}
EOF

```
### Run Docker Compose
```bash
docker-compose up -d --build

```
=======
>>>>>>> 5aa12467b2bdafd0b13669e31a973030ad2373c9
