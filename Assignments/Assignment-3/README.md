## Prerequisites
- Node Version 22
- Docker
- Docker Compose

### Complete Command Reference
```bash

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
