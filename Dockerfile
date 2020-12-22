FROM node:13

# Create the app directory
WORKDIR /app

# Copy app
COPY . .

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

EXPOSE 3030

CMD ["npm", "run", "start"]
