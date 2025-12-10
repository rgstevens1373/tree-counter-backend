FROM alpine:latest

WORKDIR /app

# Install glibc compatibility (needed for PocketBase)
RUN apk add --no-cache libc6-compat

# Copy PocketBase binary
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Copy your local pb_data folder into the container
COPY pb_data /data

# Expose the PocketBase port
EXPOSE 10000

# Start PocketBase using /data as the database directory
CMD ["./pocketbase", "serve", "--http=0.0.0.0:$PORT"]