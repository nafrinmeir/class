FROM nginx:latest

# Copy custom configuration file from the current directory
# to the Nginx configuration directory
# --- COPY nginx.conf /etc/nginx/nginx.conf

# Copy the static content into the Nginx document root
COPY . /usr/share/nginx/html

# Expose port 8082
EXPOSE 8082

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
