FROM nginx:1.27-alpine

# Servir la calculadora estática desde el subdirectorio.
COPY pricing-automatizaciones/calculator.html /usr/share/nginx/html/index.html
COPY pricing-automatizaciones/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
