FROM alpine:3.18

# Install required libs
RUN apk add --no-cache ca-certificates sqlite-libs

# Create working directory
WORKDIR /app

# Copy PocketBase binary
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Copy the migrations directory so schema is preserved
COPY pb_migrations /app/pb_migrations

# Create persistent data directory (Render mounts this automatically)
RUN mkdir -p /var/lib/pocketbase

# Expose default port (Render will override with $PORT)
EXPOSE 10000

# Run migrations, then start PocketBase
CMD sh -c "/app/pocketbase migrate up --dir=/var/lib/pocketbase \
    && /app/pocketbase serve --http=0.0.0.0:${PORT} --dir=/var/lib/pocketbase"