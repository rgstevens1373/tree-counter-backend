FROM alpine:latest

WORKDIR /app

# Install glibc compatibility
RUN apk add --no-cache libc6-compat

# Copy PocketBase binary
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Expose the port Render will use
EXPOSE 10000

# Start PocketBase
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:10000"]