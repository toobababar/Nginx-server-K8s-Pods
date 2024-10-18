# Use official Nginx base image
FROM nginx:alpine

# Copy default Nginx config
COPY ./index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80
