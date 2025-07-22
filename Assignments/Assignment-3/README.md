## Prerequisites
- Node Version 22
- Docker
- Docker Compose

### Complete Command Reference
```bash
# Installation & Testing
npm install          # Install all dependencies
npm check           # Run application tests

# Execution Options
npm start           # Run directly (port 3000)

# PM2 Process Control
pm2 delete node-app || true              # Remove existing instance
pm2 start "./src/server.js" --name node-app  # Launch via PM2
pm2 save                                 # Save process list

# Docker Deployment
docker-compose up -d --build              # Build and run containers

# Application Endpoints
http://localhost:3000/        # Hello World (direct)
http://localhost:3000/api     # JSON API (direct)
http://localhost:8080/        # Hello World (via Nginx)
http://localhost:8080/api     # JSON API (via Nginx)

# Docker Hub Reference
Image: zamshed/assignment-3-express-app
URL: https://hub.docker.com/r/zamshed/assignment-3-express-app