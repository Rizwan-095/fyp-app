# Stage 1: Build
FROM node:16-alpine AS builder

WORKDIR /usr/src/app

# Install dependencies separately for caching
COPY package*.json ./
RUN npm install --only=production

# Copy the rest of the app
COPY . .

# Stage 2: Run
FROM node:16-alpine

WORKDIR /usr/src/app

# Copy only built files and node_modules from the builder stage
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --from=builder /usr/src/app .

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
