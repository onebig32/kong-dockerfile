FROM kong:0.14.1
RUN sed -i '152c { msg = content , code = status_code })' ./usr/local/share/lua/5.1/kong/tools/responses.lua
EXPOSE 8000
EXPOSE 8001
EXPOSE 8443
EXPOSE 8444
