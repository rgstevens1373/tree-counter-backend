FROM alpine:latest

WORKDIR /app

# Install glibc compatibility (needed by PB)
RUN apk add --no-cache libc6-compat

# Copy the PB binary
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Expose Render's port
EXPOSE 10000

# Run PB
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:10000"]