#Pull base image
FROM ubuntu

# Install nginx and create website configuration
RUN apt-get update && \
    apt-get install -y nginx && \
        apt-get install -y vim && \
    rm -rf /etc/nginx/sites-available/default && \
    rm -rf /etc/nginx/sites-enabled/default && \
    sed -i '/^daemon/d' /etc/nginx/nginx.conf && \
    echo "daemon off;" >> /etc/nginx/nginx.conf

# Copy website files and create website configuration
COPY arsha  /etc/arsha/
COPY arsfile /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

# Expose port 80
EXPOSE 80

# Start nginx when container starts
CMD ["nginx"]

