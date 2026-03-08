# Use a lightweight Node image
FROM node:18-alpine

# Set environment variables
ENV NODE_ENV=production
ENV PORT=8080

# Set working directory
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm@9.12.2

# Copy package files
COPY package*.json ./

# Install dependencies (ignore frozen-lockfile to avoid build errors)
RUN pnpm install --no-frozen-lockfile

# Copy the rest of the app
COPY . .

# Expose the port (matches your index.js)
EXPOSE 8080

# Start the app
CMD ["node", "src/index.js"]
