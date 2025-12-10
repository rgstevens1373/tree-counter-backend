FROM alpine:3.18

# Install certificates
RUN apk add --no-cache ca-certificates

# Set working directory
WORKDIR /app

# Copy pocketbase binary
COPY pocketbase /app/pocketbase

# Ensure executable permissions
RUN chmod +x /app/pocketbase

# Create the data directory (Render mounts over this)
RUN mkdir -p /var/lib/pocketbase

# Expose PB port
EXPOSE 10000

# Start PocketBase and point it to the mounted disk
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:10000", "--dir", "/var/lib/pocketbase"]