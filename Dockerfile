# Use Ubuntu as the base image
FROM ubuntu:24.04

# Set environment variables to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache2 and other necessary packages
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Copy the HTML file into the Apache web root directory
COPY index.html /var/www/html/

# Expose port 80 (default HTTP port for Apache)
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

