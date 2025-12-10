FROM alpine:3.18

# Install certificates
RUN apk add --no-cache ca-certificates

# Create working directory
WORKDIR /app

# Copy PocketBase binary and your pb_data if you prebundled anything
COPY pocketbase /app/pocketbase

# Make PocketBase executable
RUN chmod +x /app/pocketbase

# Create the data directory (Render will mount over this)
RUN mkdir -p /var/lib/pocketbase

# Expose the port PocketBase will use
EXPOSE 10000

# Start PocketBase using the persistent directory
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:10000", "--dir", "/var/lib/pocketbase"]