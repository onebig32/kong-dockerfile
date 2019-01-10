FROM kong:0.14.1
ENV KONG_DATABASE postgres
ENV KONG_PG_HOST 10.0.2.15
ENV KONG_PROXY_ACCESS_LOG /dev/stdout
ENV KONG_ADMIN_ACCESS_LOG /dev/stdout
ENV KONG_PROXY_ERROR_LOG /dev/stderr
ENV KONG_ADMIN_ERROR_LOG /dev/stderr
ENV KONG_ADMIN_LISTEN 0.0.0.0:8001, 0.0.0.0:8444 ssl
RUN sed -i '152c { msg = content , code = status_code })' ./usr/local/share/lua/5.1/kong/tools/responses.lua
RUN kong migrations up
EXPOSE 8000
EXPOSE 8001
EXPOSE 8443
EXPOSE 8444
