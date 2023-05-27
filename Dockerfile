# Base Image
FROM node:lts-alpine3.17

# Set the working directory
WORKDIR /app

# Copy package.json
COPY package*.json .

# Install dependencies
RUN npm install

# Copy source code to container work directory
COPY . .

# Expose port
EXPOSE 3000

# Entry for CMD
CMD ["node", "server.js"]
