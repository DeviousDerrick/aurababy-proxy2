# Base Node image
FROM node:18-alpine

# Set environment
ENV NODE_ENV=production
ENV PORT=8080

# Working directory
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm@9.12.2

# Install system build tools (needed for some npm modules)
RUN apk add --no-cache python3 make g++

# Copy package files
COPY package*.json ./

# Install dependencies ignoring frozen lockfile
RUN pnpm install --no-frozen-lockfile

# Copy the rest of the app
COPY . .

# Expose port
EXPOSE 8080

# Start the app
CMD ["node", "src/index.js"]
