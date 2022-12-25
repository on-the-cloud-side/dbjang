# Use the alpine version of Node 14
# that is half the size of a standard node image
# also can try 14-slim
FROM node:14-alpine

# Install Angular CLI
RUN npm install -g @angular/cli

# Create a non-root user to run the application
# note: useradd is not available in alpine
# RUN useradd --user-group --create-home --shell /bin/false app

# Set the working directory for the application
WORKDIR /home/app

# Copy the package.json file and install dependencies
COPY package*.json ./
RUN npm install

# Copy the application source code
COPY . .

# Set the user for the application
# USER app

# Start the application
CMD ["ng", "serve", "--host", "0.0.0.0"]

#  You can also specify the configuration file to use using the --configuration option. By default, the development configuration file (environments/environment.ts) will be used.
#  This will use the production configuration file (environments/environment.prod.ts) to serve the application.
#  ng serve --configuration=production
