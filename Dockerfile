FROM nginx:latest

# Copy your index.html file
COPY index.html /usr/share/nginx/html/

# Expose port 8082
EXPOSE 8082

