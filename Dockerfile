# Serves the static index.html with nginx.
# Railway injects $PORT at runtime; 8080 is the fallback for local runs.
FROM nginx:1.27-alpine

ENV PORT=8080

# The nginx image runs envsubst on /etc/nginx/templates/*.template at startup,
# writing the result to /etc/nginx/conf.d/ with ${PORT} filled in.
COPY nginx.conf.template /etc/nginx/templates/default.conf.template
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 8080
