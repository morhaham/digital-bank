# Use the specified Node.js version
FROM node:20.9.0-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and pnpm-lock.yaml to the container
COPY package.json pnpm-lock.yaml ./

# Install app dependencies
RUN npm install -g pnpm && pnpm install

# Bundle app source
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Start the app
CMD ["pnpm", "start"]