# Use an official Node.js runtime as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
COPY node_modules/ ./node_modules/

# Copy the entire project to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
