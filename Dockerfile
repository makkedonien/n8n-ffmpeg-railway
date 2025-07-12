# Use the official n8n image as base
FROM n8nio/n8n:latest

# Switch to root user to install packages
USER root

# Update package list and install ffmpeg
RUN apk update && \
    apk add --no-cache \
    ffmpeg \
    curl \
    && rm -rf /var/cache/apk/*

# Switch back to the default node user for security
USER node

# Expose the default n8n port
EXPOSE 5678

# Use the default n8n entrypoint
CMD ["n8n"]
