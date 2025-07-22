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
