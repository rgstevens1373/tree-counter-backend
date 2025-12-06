FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache libc6-compat

COPY pocketbase /app/pocketbase
RUN chmod +x /app/pocketbase

EXPOSE 10000

# Superuser credentials
ENV ADMIN_EMAIL=rob@example.com
ENV ADMIN_PASSWORD=SuperSecret123
ENV ADMIN_NAME=Rob

CMD ["/app/pocketbase","serve","--http=0.0.0.0:10000","--dir=/data"]