FROM nginx:1.27-alpine

# Copiamos la calculadora como landing principal.
COPY calculator.html /usr/share/nginx/html/index.html

# Configuración simple de Nginx para servir estático.
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
