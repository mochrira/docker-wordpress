FROM wordpress:latest
RUN groupadd -g 1000 wordpress
RUN useradd -m -g 1000 -u 1000 wordpress
RUN chown -R wordpress:wordpress /var/www/html
USER wordpress
WORKDIR /var/www/html