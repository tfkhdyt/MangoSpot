FROM bitnami/apache:2.4-debian-12
WORKDIR /app/MangoSpot
COPY . .
# RUN a2enmod rewrite