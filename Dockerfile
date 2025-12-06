FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache libc6-compat

# Copy PocketBase binary
COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

# Copy your local pb_data into the container
COPY pb_data /data

EXPOSE 10000

CMD ["/app/pocketbase","serve","--http=0.0.0.0:10000","--dir=/data"]