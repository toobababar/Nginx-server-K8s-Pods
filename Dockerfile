# Use official Nginx base image
FROM nginx:1.27.4-alpine3.21-slim

# Copy default Nginx config
COPY ./index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80
