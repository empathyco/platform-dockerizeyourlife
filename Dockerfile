# You can extend an existing image
FROM ubuntu
# Add metadata
LABEL "com.empathy.talk"="Dockerize you live"
LABEL maintainer="cesarg@empathy.co"
# Expose ports
EXPOSE 3000
# Set the user
USER root
# Set build arguments
ARG EMAIL
ARG COMPANY=empathy
# It is possible to run cmd
RUN apt update && apt install -y vim
RUN mkdir /app /myvol
# You can set enviromentals vars
ENV MY_VAR "empathy"
# You can copy files
ADD app /app
COPY README.md /app/
RUN sed -i 's/EMAIL/'${EMAIL}'/' /app/vim.md
# Add a volume
# You can set the working directory
WORKDIR /app
# Set a healthcheck
HEALTHCHECK --interval=5m --timeout=3s \
  CMD cat /app/vim.md || exit 1
# Set a init cmd
#CMD ["vim", "/app/vim.md"]
ENTRYPOINT ["vim", "/app/vim.md"]

